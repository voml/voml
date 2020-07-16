RFC4: Standardize Reference
===========================

急需解决

https://github.com/lightbend/config/blob/master/HOCON.md#self-referential-substitutions

自引用

a = $a

a = {b: $a}


循环引用

a = $b
b = $a
