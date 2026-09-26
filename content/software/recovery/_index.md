---
title: "Recovery"
weight: 14
description: "Getting data back off a deleted volume or a failing disk."
---

{{< lead >}}Undelete, carve and salvage — for the moment after the mistake, and the moment the drive starts clicking.{{< /lead >}}

Two different problems: a file that was deleted, and a disk that is dying. Read a failing drive to an image first, then recover from the image — every extra pass over bad media costs you sectors.

{{< cards cols="3" >}}
{{< card link="ddrescue" title="GNU ddrescue" icon="save-as" subtitle="Image a failing disk, resumably, sector by sector." >}}
{{< card link="testdisk" title="TestDisk & PhotoRec" icon="search" subtitle="Rebuild lost partitions, then carve files without one." >}}
{{< card link="disk-drill" title="Disk Drill" icon="desktop-computer" subtitle="Scan, preview and recover with a native interface." >}}
{{< card link="data-rescue" title="Data Rescue" icon="support" subtitle="Long-standing commercial recovery for macOS." >}}
{{< card link="foremost" title="foremost" icon="document-duplicate" subtitle="Carve files out of an image by header and footer." >}}
{{< /cards >}}
