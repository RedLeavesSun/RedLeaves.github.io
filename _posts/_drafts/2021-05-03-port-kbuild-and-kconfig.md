---
layout: post
title: Kbuild和Kconfig框架移植
subtitle:
date: 2021-05-03 18:16:46 +0800
author: RedLeaves
header-img:
catalog: true
tag:
  - kbuild
  - kconfig
---

上一篇文章笔者分析了Kbuild和Kconfig框架，那么本文将讲述如何移植Kbuild和Kconfig框架。本文基于Linux Kernle 5.12.0进行移植。

##

首先，先构造项目目录

`mkdir kbuild`

`cd kbuild`

为了方便移植，构造和Linux Kernel一样的目录结构。

`mkdir scripts`
`mkdir scripts/kconfig`

`cp ../linux/scripts/Kconfig.include scripts`
`cp ../linux/scripts/Kbuild.include scripts`
`cp ../linux/scripts/Makefile.* scripts`
`cp ../linux/scripts/kconfig/* scripts/kconfig`

到此为止，已经有了一个基本的样子，只需要在顶层目录下创建自己的Makefile即可。

为了