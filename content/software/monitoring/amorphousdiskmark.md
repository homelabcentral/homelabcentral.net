---
title: "AmorphousDiskMark"
weight: 8
description: "Disk throughput and IOPS benchmark."
---

{{< lead >}}CrystalDiskMark's test suite on macOS — sequential and random read/write in MB/s and IOPS.{{< /lead >}}

{{< badge content="Mac App Store" color="purple" icon="shopping-bag" link="https://apps.apple.com/us/app/id1168254295" >}}

## What it does

AmorphousDiskMark measures storage performance with the same test shapes CrystalDiskMark made standard: sequential 1 MiB reads and writes at various queue depths, and random 4 KiB operations, reported in both MB/s and IOPS.

That matters because sequential and random performance are unrelated numbers. A drive advertising 1,000 MB/s sequential may be dismal at 4 KiB random, which is the figure that determines whether a VM or a database on it feels fast.

## Notes

Use it to check what an enclosure and cable combination actually deliver — a Thunderbolt SSD negotiated down to USB 2.0 is immediately obvious in the numbers, and [WhatCable](/software/networking/whatcable/) explains why. Free on the App Store, with in-app purchases for extra test profiles.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Blackmagic Disk Speed Test](https://apps.apple.com/app/id425264550) | Free | App Store, sequential throughput only |
| [fio](https://github.com/axboe/fio) | Open source | The serious tool, fully scriptable, no interface |
| `dd` | Built in | A crude sequential number in one command |
{{< /borderless-table >}}

## Install

[AmorphousDiskMark on the Mac App Store](https://apps.apple.com/us/app/id1168254295)

Or with `mas`:

```shell
mas install 1168254295
```

## Links

{{< cards cols="2" >}}
{{< card link="https://apps.apple.com/us/app/id1168254295" title="Mac App Store" icon="shopping-bag" subtitle="Free on the Mac App Store" >}}
{{< /cards >}}
