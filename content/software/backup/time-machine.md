---
title: "Time Machine"
weight: 1
description: "Hourly versioned backups, including to a Linux server."
---

{{< lead >}}The backup that is already installed and already knows what to do. Point it at a disk once and stop thinking about it.{{< /lead >}}

{{< badge content="Built in" color="gray" icon="iconify:bi/apple" size="lg" link="https://support.apple.com/en-us/104984" >}}

## What it does

Time Machine takes an APFS snapshot of the startup volume hourly, copies it to a backup destination, and thins the history as space runs out — hourly for a day, daily for a month, weekly for as long as it fits. Restores run from Finder for a single file, from Migration Assistant for a whole account, or from macOS Recovery for the entire machine.

It is versioned, not a clone. The backup disk does not boot; it rebuilds a Mac onto a working one.

{{% steps %}}

### Attach a disk

Any external disk works. Erase it as **APFS** in Disk Utility if it is only ever going to hold backups — Time Machine has used APFS rather than HFS+ since Big Sur, and it will offer to erase a disk you hand it.

### Turn it on

**System Settings → General → Time Machine → Add Backup Disk**, pick the disk, and choose whether to encrypt it. Encrypt it.

### Set the details

Options worth changing once:

- **Back up frequency** — hourly by default, and every 24 hours or manual are the other choices.
- **Exclude** the directories you can rebuild — see below.

### Check it works

```shell
tmutil destinationinfo
tmutil latestbackup
tmutil startbackup --block
```

A destination that lists, a backup that dates from this hour, and a manual run that completes. Then restore one file from the Finder's **Enter Time Machine**, because a backup nobody has ever restored from is a hypothesis.

{{% /steps %}}

## Excluding directories

Anything you can rebuild from a package manager or a `git clone` is worth keeping out: it costs backup space, slows every run, and restores something you did not want. macOS already skips caches, trash and temporary files through its own exclusion list, so this is about your own directories.

{{% steps %}}

### Add them in System Settings

**System Settings → General → Time Machine → Options…**, then **+** and pick the folders. The list shows the total size of what you have excluded, which is a useful sanity check after adding a few.

### Or add them from the command line

```shell
tmutil addexclusion ~/Code/project/node_modules
tmutil addexclusion ~/Library/Developer/Xcode/DerivedData
```

That is a **sticky** exclusion: it attaches to the item, so it survives a move or a rename, and a copy of the directory inherits it.

To exclude a path rather than an item — anything that ends up there is excluded, and the exclusion stays put when the current occupant is deleted:

```shell
sudo tmutil addexclusion -p /Users/you/VMs
```

{{< callout type="warning" >}}
`-p` and `-v` both need root **and** Full Disk Access for the terminal you run them from. Without Full Disk Access the command exits without doing anything useful — grant it in **System Settings → Privacy & Security → Full Disk Access**.
{{< /callout >}}

### Confirm what is excluded

```shell
tmutil isexcluded ~/Library/Caches ~/Code/project/node_modules
```

Prints `[Excluded]` or `[Included]` against each path, which is the only way to be sure a rule landed on what you meant.

### Undo one

```shell
tmutil removeexclusion ~/Code/project/node_modules
sudo tmutil removeexclusion -p /Users/you/VMs
```

The flags have to match how the exclusion was added — removing a fixed-path rule without `-p` does nothing.

{{% /steps %}}

Worth excluding on most machines:

| Path                                          | Why                                                                 |
| --------------------------------------------- | ------------------------------------------------------------------- |
| `node_modules`, `target`, `.venv`, `vendor`   | Reinstallable in one command, and enormous                          |
| `~/Library/Developer/Xcode/DerivedData`       | Build output, regenerated on the next build                         |
| `~/Library/Containers/com.docker.docker/Data` | A single multi-gigabyte disk image that changes constantly          |
| VM disks — Parallels, UTM, VMware             | Same problem, larger, and backed up whole every time                |
| `~/Downloads`                                 | Installers you already used, if you treat it as a scratch directory |

A whole volume is a different verb: `sudo tmutil addexclusion -v /Volumes/Scratch`, which tracks it by filesystem UUID rather than by name or mount point.

## Backing up to a Linux server

Time Machine will write to an SMB share that advertises itself correctly, which means any Linux box with Samba can be the destination. The three pieces are a share configured with Samba's `fruit` VFS module, a user that owns it, and Avahi telling the network it exists.

{{< callout type="info" >}}
Needs Samba 4.8 or newer for Time Machine support. On anything current that is what you have — `smbd --version` confirms it.
{{< /callout >}}

{{% steps %}}

### Install Samba and the VFS modules

```shell
sudo apt install samba samba-vfs-modules avahi-daemon
```

### Create the user and the directory

A dedicated account that cannot log in, owning the backup directory:

```shell
sudo useradd -M -s /usr/sbin/nologin timemachine
sudo smbpasswd -a timemachine
sudo mkdir -p /srv/timemachine
sudo chown timemachine:timemachine /srv/timemachine
sudo chmod 700 /srv/timemachine
```

The filesystem underneath has to support extended attributes — ext4, XFS, Btrfs and ZFS all do. exFAT and FAT do not, and the backup will fail in confusing ways.

### Configure the share

```ini {filename="/etc/samba/smb.conf"}
[global]
fruit:aapl = yes
fruit:nfs_aces = no
fruit:model = MacSamba
fruit:metadata = stream
fruit:veto_appledouble = no
fruit:posix_rename = yes
fruit:wipe_intentionally_left_blank_rfork = yes
fruit:delete_empty_adfiles = yes
min protocol = SMB2

[timemachine]
comment = Time Machine
path = /srv/timemachine
vfs objects = catia fruit streams_xattr
fruit:time machine = yes
fruit:time machine max size = 1T
valid users = timemachine
writable = yes
browseable = yes
guest ok = no
```

Two things about that file:

- `vfs objects` in a share **replaces** the global list rather than adding to it, so it belongs in the share stanza, and `fruit` must come before `streams_xattr`.
- `fruit:time machine max size` is the quota advertised to the Mac. Without it Time Machine will happily grow until the server's disk is full.

### Advertise it with Avahi

```xml {filename="/etc/avahi/services/timemachine.service"}
<?xml version="1.0" standalone='no'?>
<!DOCTYPE service-group SYSTEM "avahi-service.dtd">
<service-group>
  <name replace-wildcards="yes">%h</name>
  <service>
    <type>_smb._tcp</type>
    <port>445</port>
  </service>
  <service>
    <type>_device-info._tcp</type>
    <port>0</port>
    <txt-record>model=TimeCapsule8,119</txt-record>
  </service>
  <service>
    <type>_adisk._tcp</type>
    <port>9</port>
    <txt-record>dk0=adVN=timemachine,adVF=0x82</txt-record>
    <txt-record>sys=waMa=0,adVF=0x100</txt-record>
  </service>
</service-group>
```

`adVN=` is the share name and has to match the stanza. The `model` record is what makes Finder draw it as a Time Capsule rather than a generic server.

```shell
sudo systemctl restart smbd avahi-daemon
```

mDNS needs `5353/udp` open, and SMB needs `445/tcp`.

### Add it on the Mac

The share should now appear under **Add Backup Disk**. If it does not, mount it first — **Finder → Go → Connect to Server**, `smb://server.local/timemachine` — and it will be listed. From the command line:

```shell
sudo tmutil setdestination -a "smb://timemachine@server.local/timemachine"
tmutil destinationinfo
```

{{% /steps %}}

## Notes

- A network backup lives inside a sparsebundle disk image, which is why the quota matters and why the first run is slow. Do the first backup over Ethernet; hourly increments are fine over Wi-Fi afterwards.
- Apple supports Time Machine over SMB to its own and to certified devices. A Samba share is not certified, works well in practice, and deserves an occasional **Verify Backups** from the Time Machine menu bar item.
- Local snapshots live on the startup disk and are not a backup. `tmutil listlocalsnapshots /` shows them; they are what lets you restore between backups, and they vanish with the disk.
- A share that refuses to appear as a destination can be forced into the list with `defaults write com.apple.systempreferences TMShowUnsupportedNetworkVolumes 1`. Needing it means the share is not advertising Time Machine support, so fix the `fruit:` settings instead.
- Two destinations can be configured at once and Time Machine alternates between them — a local disk and the server is a good pairing.

## Alternative to

{{< borderless-table >}}
| Alternative                                                | Type        | Trade-off                                                                  |
| ---------------------------------------------------------- | ----------- | -------------------------------------------------------------------------- |
| [Carbon Copy Cloner](/software/backup/carbon-copy-cloner/) | Paid        | Control over scheduling and retention, and it can make a bootable copy     |
| [restic](/software/backup/restic/)                         | Open source | Off-site destinations and any operating system, but you write the schedule |
| [Arq](/software/backup/arq/)                               | Paid        | The same hands-off feeling, pointed at cloud storage you own               |
| [Kopia](/software/backup/kopia/)                           | Open source | Declarative retention policies rather than Apple's fixed thinning          |
| [SuperDuper!](/software/backup/superduper/)                | Freemium    | A copy you can start the machine from; no version history                  |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Built in" selected=true >}}

Nothing to install. **System Settings → General → Time Machine**, or from the command line:

```shell
man tmutil
tmutil destinationinfo
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://support.apple.com/en-us/104984" title="Apple support" icon="globe-alt" subtitle="Back up with Time Machine" >}}
{{< card link="https://wiki.samba.org/index.php/Configure_Samba_to_Work_Better_with_Mac_OS_X" title="Samba wiki" icon="server" subtitle="The fruit VFS options, from upstream" >}}
{{< card link="https://support.apple.com/en-us/102551" title="Restore from a backup" icon="refresh" subtitle="Migration Assistant and Recovery" >}}
{{< /cards >}}
