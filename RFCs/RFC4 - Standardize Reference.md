RFC4: Standardize Reference
===========================



自引用

a = $a

a = {b: $a}


循环引用

a = $b
b = $a
