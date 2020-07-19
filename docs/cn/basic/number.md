## Integer

整数默认是大整数类型

可以带正负号, 可以带下划线

## Typed Integer

整数的注解在数字后方

数字与注解之间不能带空格也不能带回车

```toml
default = 0
int1 =+99
int2 = 42
int3 = 0
int4 =-17
int7 = 1_2_3_4_5
```

## Decimal

小数默认是高精度小数类型


## Typed Decimal

小数的类型注解在数字后方

```toml
0.1f32
```

## Bytes

字节数

不能使用下划线

```toml
0x0
0o0
0f0
```

## Typed Bytes



```toml
0x001_i32
```


## warning

- 不要使用多重下划线

```toml
1__2
```

- 不要使用多重前导零

```toml
0000
0001
00.2
```

- 不要使用大小写混用的比特输入

```toml
0xFfF
```




## error

- 禁止残缺小数

```bash
123.
.012
```

- 禁止残缺下划线

```bash
1_
_12
0._5
```

- 禁止多重符号

```bash
+-1
++0
```


- 禁止多重小数
```bash
1.0.0
```

- 禁止多重字节

```bash
0x
```
