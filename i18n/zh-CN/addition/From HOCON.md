Starting with HOCON
===================

HOCON 和 ARC 一样, 都兼容 JSON.

从功能上来讲是 ARC 的超集.



词法上去掉绑定符 `:` 或者 `=` 似乎没有问题, 不过这严重降低可读性, ARC 不会考虑这类改造.



ARC 考虑通过一个指令宏 `@order` 实现这些扩展

```
service_b: {
  host: yyy
  db: $db_connection {
    host: abc
  }
}
```

不过副作用看来很难处理, 总是会留下一些尸体.

```arc
% return dict
lint = @order`include ./lint.arc` 
% return nothing
orders = [
    @order`patch $lint/"force-fp"=false`
]
```
