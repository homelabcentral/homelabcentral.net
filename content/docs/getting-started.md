---
title: Getting Started
weight: 1
---

## What a home lab is for

A home lab is a machine you control end to end: the storage, the network path,
the update schedule, and the failure modes. The point is not to replace every
hosted service, it is to know exactly what happens to the ones you do run.

## Start with one box

Resist the urge to build a cluster. One machine with enough RAM to hold your
working set, a pair of mirrored disks, and a UPS will teach you more than three
nodes you are afraid to reboot.

{{< callout type="info" >}}
Idle power is the number that matters. A server drawing 90W costs roughly ten
times as much to run over three years as one drawing 9W, and you will notice
the electricity bill long before you notice the extra cores.
{{< /callout >}}

## Next steps

- Pick a hypervisor or container runtime and stay on it for a year
- Put backups somewhere the lab cannot reach with its own credentials
- Write down what you did, before you forget why
