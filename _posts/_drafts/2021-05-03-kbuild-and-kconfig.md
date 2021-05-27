---
layout: post
title: Kbuild编译框架与Kconfig配置框架
subtitle:
date: 2021-05-03 04:21:00 +0800
author: RedLeaves
header-img:
catalog: true
tag:
  - kbuild
  - kconfig
---

## 1 前言
* 本文假设读者了解并使用过make工具，熟悉Makefile语法规则。
* 本文假设读者了解并使用过Kconfig，如，为驱动程序编写Kconfig文件。
* 本文假设读者了解并使用过Kbuild，如，为驱动程序编写Makefile文件。

## 2 介绍
* Kbuild全称kernel build，是一套用于编译Linux Kernel的脚本框架。Kconfig全称kernel config，是一套用于配置Linux Kernel的配置框架。
* Kbuild和Kconfig框架诞生于Linux Kernel，u-boot和RT-Thread等项目的编译也同样使用Kbuild和Kconfig框架。
* 本文基于Linux Kernel 5.12.0版本进行分析。

## 3 前置知识
### 3.1 $@、$<和$^
* $@表示目标。
* $<表示第一个依赖。
* $^表示所有依赖。

### 3.2 include和-include
* include和-include的区别在于-include如果引入了不存在的文件，编译时不会报错。

### 3.3 常见函数
* $(if condition,then-part[,else-part])
* $(filter pattern…,text)和$(filter-out pattern…,text)
  * filter 符合pattern的都留下
  * filter-out 符合pattern的都不要
* $(wildcard pattern)
  * 展开变量中的通配符
  * 枚举当前目录下符合pattern的文件或文件夹
* $(subst from,to,text)和$(patsubst pattern,replacement,text)
  * 两者的区别是patsubst比subst带pattern模式

## 4 分析
### 4.1 源码路径
Kbuild框架的源码在scripts目录下，涉及到的文件有Kbuild.include、Kconfig.include、Makefile.lib和Makefile.\*。
Kbuild.include是一些Kbuild框架通用定义。Kconfig.include是一些Kconfig工具宏定义。
Makefile.lib是一个Kbuild库，该库定义了一些列变量和方法供Makefile.\*文件使用。
Makefile.\*文件分模块分别实现代码编译和产物清理等功能。

### 4.2 代码编译

### 4.3 产物清理

### 4.2 核心接口
在Kbuild.include文件中，

```makefile
###
# Shorthand for $(Q)$(MAKE) -f scripts/Makefile.build obj=
# Usage:
# $(Q)$(MAKE) $(build)=dir
build := -f $(srctree)/scripts/Makefile.build obj

###
# Shorthand for $(Q)$(MAKE) -f scripts/Makefile.dtbinst obj=
# Usage:
# $(Q)$(MAKE) $(dtbinst)=dir
dtbinst := -f $(srctree)/scripts/Makefile.dtbinst obj

###
# Shorthand for $(Q)$(MAKE) -f scripts/Makefile.clean obj=
# Usage:
# $(Q)$(MAKE) $(clean)=dir
clean := -f $(srctree)/scripts/Makefile.clean obj
```



## 参考资料
* [GNU make](https://www.gnu.org/software/make/manual/make.html)
* [Recipe Echoing](https://www.gnu.org/software/make/manual/make.html#Echoing)
