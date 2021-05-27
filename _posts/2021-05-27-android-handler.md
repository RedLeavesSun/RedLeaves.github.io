---
layout: post
title: Android Handler
subtitle:
date: 2021-05-27 18:36:24 +0800
author: RedLeaves
header-img:
catalog: true
tag:
  - android hanlder
---

## 1 机制
![](https://raw.githubusercontent.com/RedLeavesSun/RedLeavesSun.github.io/gh-pages/_posts/2021-05-27-android-handler/img/android-handler.png)

## 2 其他
Handler有sendMessage和post两种用法，但本质上都是Message，post是通过sendMessage实现的。
```java
public final boolean post(@NonNull Runnable r) {
    return  sendMessageDelayed(getPostMessage(r), 0);
}
```

sendMessage最后都是通过enqueueMessage将Message加入Message Queue的。

Looper.loop是一个死循环，负责消息分发。
```java
public static void loop() {
    // ...
    for (;;) {
        Message msg = queue.next(); // might block
        // ...
        msg.target.dispatchMessage(msg);
        // ...
        msg.recycleUnchecked();
    }
    // ...
}
```

Handler有sendMessage和post两种用法，dispatchMessage针对两种用法分别实现。
```java
public void dispatchMessage(@NonNull Message msg) {
    if (msg.callback != null) {
        handleCallback(msg);
    } else {
        if (mCallback != null) {
            if (mCallback.handleMessage(msg)) {
                return;
            }
        }
        handleMessage(msg);
    }
}
```

mCallback在构造Handler时传入，作用和重载handleMessage函数一样。

## 3 参考文档
* [Handler](https://developer.android.com/reference/android/os/Handler)
