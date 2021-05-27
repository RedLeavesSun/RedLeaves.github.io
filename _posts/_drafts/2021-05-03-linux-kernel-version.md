---
layout: post
title: Linux Kernel版本介绍与代码下载
subtitle:
date: 2021-05-03 00:15:00 +0800
author: RedLeaves
header-img:
catalog: true
tag:
  - linux kernel
---

## 版本命名规则

网络上有许多关于Linux Kernel版本命令介绍，其中谈及的奇偶命名规则，是内核社区在2004年就弃用的命令规则。

现在社区采用的是x.y.z命名规则，x代表主版本号，y每隔数月滚动一次，z一般代表安全更新和BUG修复，rc后缀则代表这是一个候选版本。y的滚动和rc有关，一般社区会先发布几个x.y.z-rc的候选版本，当时机成熟时，Linus就会把后缀去掉，使其变成x.y.z。下面是维基百科关于[内核版本命名规则](https://en.wikipedia.org/wiki/Linux_kernel#Version_numbering)的介绍。

> Linux kernel development has used three different version numbering schemes.

> The first scheme was used in the run-up to version 1.0. The first version of the kernel was 0.01. This was followed by 0.02, 0.03, 0.10, 0.11, 0.12 (the first GPL version), 0.95, 0.96, 0.97, 0.98, 0.99 and then 1.0.[361] From 0.95 on there were many patch releases between versions.

> After the 1.0 release and prior to version 2.6, the number was composed as "a.b.c", where the number "a" denoted the kernel version, the number "b" denoted the major revision of the kernel, and the number "c" indicated the minor revision of the kernel. The kernel version was changed only when major changes in the code and the concept of the kernel occurred, twice in the history of the kernel: in 1994 (version 1.0) and in 1996 (version 2.0). Version 3.0 was released in 2011, but it was not a major change in kernel concept. The major revision was assigned according to the even–odd version numbering scheme. The minor revision had been changed whenever security patches, bug fixes, new features or drivers were implemented in the kernel.

> In 2004, after version 2.6.0 was released, the kernel developers held several discussions regarding the release and version scheme[362][363] and ultimately Linus Torvalds and others decided that a much shorter "time-based" release cycle would be beneficial. For about seven years, the first two numbers remained "2.6", and the third number was incremented with each new release, which rolled out after two to three months. A fourth number was sometimes added to account for bug and security fixes (only) to the kernel version. The even-odd system of alternation between stable and unstable was gone. Instead, development pre-releases are titled release candidates, which is indicated by appending the suffix '-rc' to the kernel version, followed by an ordinal number.

> The first use of the fourth number occurred when a grave error, which required immediate fixing, was encountered in 2.6.8's NFS code. However, there were not enough other changes to legitimize the release of a new minor revision (which would have been 2.6.9). So, 2.6.8.1 was released, with the only change being the fix of that error. With 2.6.11, this was adopted as the new official versioning policy. Later it became customary to continuously back-port major bug-fixes and security patches to released kernels and indicate that by updating the fourth number.

> On 29 May 2011, Linus Torvalds announced[364] that the kernel version would be bumped to 3.0 for the release following 2.6.39, due to the minor version number getting too large and to commemorate the 20th anniversary of Linux. It continued the time-based release practice introduced with 2.6.0, but using the second number; for example, 3.1 would follow 3.0 after a few months. An additional number (now the third number) would be added on when necessary to designate security and bug fixes, as for example with 3.0.18; the Linux community refers to this as "x.y.z" versioning. The major version number was also later raised to 4, for the release following version 3.19.[365][b]

> In addition to Torvalds' -rc development releases, the version number was sometimes suffixed with letter sequences, such as tip, which were at times the initials of a software developer, indicating another development branch. For example, ck stands for Con Kolivas and ac stands for Alan Cox. Sometimes, the letters are related to the primary development area of the branch the kernel is built from, for example, wl indicates a wireless networking test build. Also, distributors may have their own suffixes with different numbering systems and for back-ports to their enterprise (i.e. stable but older) distribution versions.

## 令人迷惑的“稳定版”

Linux Kernel的稳定版有两种意思。一种是指x.y.z相对于x.y.z-rc，x.y.z称为稳定版，另一种是指可以用于生产环境的稳定版，也叫长期支持版。关于内核版本的发行，可以参考[Active kernel releases](https://www.kernel.org/releases.html)。

## 如何获取源码

在Linux Kernel的[主页](https://www.kernel.org/)，我们可以看到有三种方式可以获取源码，HTTP、GIT和RSYNC(已弃用)。HTTP的方式其实就是下载tar包，这种方式下载的代码没有GIT仓库，无法查看历史提交，所以我们选择GIT方式下载。

在GIT仓库的[主页](https://git.kernel.org/)，我们可以看到许多仓库。Linux内核由许多模块组成，为了方便维护和管理，这些模块都对应建立各自的仓库。这些仓库的提交经过审核和测试后，就会被合入主线，然后积累成候选版本，最后变成稳定版本。下面这两个仓库都无法看到最新的提交，因为最新的提交都是先提交到对应的模块的仓库，然后社区会定时开启一个窗口期，将这些提交合入成为一个新的候选版本。

* 主线分支：Linux kernel stable tree

  `git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git`

  `git clone https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git`

  `git clone https://kernel.googlesource.com/pub/scm/linux/kernel/git/stable/linux.git`

* 候选发布分支：Linux Stable -rc releases

  `git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git`

  `git clone https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git`

  `git clone https://kernel.googlesource.com/pub/scm/linux/kernel/git/stable/linux-stable-rc.git`
