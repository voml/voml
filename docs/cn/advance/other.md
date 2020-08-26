Other irregularities
====================


## warning

- Root EOS

```arc
key = 1;
```

- 不一致的 EOS

```arc
key = {
  one = 1;
  two = 2,
}
```


- inline 时多余的 EOS

```arc
case1 = {one = 1;}
case2 = ("string",)
```

## error

- 多重 EOS

```arc
key = 1;;
```





