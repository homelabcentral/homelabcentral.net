---
title: "Secure Erase"
weight: 20
description: "Destroying data on a disk you are selling, returning or retiring."
---

{{< lead >}}Making data unrecoverable before the disk leaves your hands.{{< /lead >}}

On anything modern the honest answer is encryption: wear levelling and spare blocks mean an overwrite cannot reach every cell, so destroying the key beats scrubbing the platter. Overwriting still has its place — mechanical disks, and drives whose firmware you do not trust to sanitise itself.

{{< cards cols="3" >}}
{{< card link="diskutil-secure-erase" title="diskutil secureErase" icon="terminal" subtitle="The built-in overwrite, and Apple's own warning about it." >}}
{{< card link="shredos" title="ShredOS" icon="fire" subtitle="Bootable nwipe, with SSD and NVMe support." >}}
{{< card link="dban" title="DBAN" icon="ban" subtitle="The one everybody remembers, and why not to use it now." >}}
{{< card link="parted-magic" title="Parted Magic" icon="shield-check" subtitle="Drive-firmware sanitise for ATA, NVMe, SAS and eMMC." >}}
{{< card link="dcfldd" title="dcfldd" icon="refresh" subtitle="dd with patterns, hashing and a progress meter." >}}
{{< /cards >}}
