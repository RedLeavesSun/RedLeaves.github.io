---
layout: post
title: Android Boot —— init进程
subtitle:
date: 2022-02-17 15:21:17 +0800
author: RedLeaves
header-img:
catalog: true
tag:
  - android boot init
---

## 1 介绍
init进程启动分为三个阶段
* first stage: 加载启动系统所需的最小资源
* selinux setup: 设置selinux
* second stage: 执行rc脚本，加载整个Android
![](https://raw.githubusercontent.com/RedLeavesSun/RedLeavesSun.github.io/gh-pages/_posts/2022-02-17-android-boot-init/img/android-boot-init-three-state.png)

init进程中最为重要的是`second state`，整个阶段的核心是一个rc脚本解析器。解析器加rc脚本，完成了整个Android系统的启动。

下面展示的是解析器的启动代码。
```C++
ActionManager& am = ActionManager::GetInstance();
ServiceList& sm = ServiceList::GetInstance();

LoadBootScripts(am, sm);
```

下面展示的是`event`的启动顺序。
![](https://raw.githubusercontent.com/RedLeavesSun/RedLeavesSun.github.io/gh-pages/_posts/2022-02-17-android-boot-init/img/android-boot-init-event.png)

## 2 参考资料
* system/core/init/README.md
