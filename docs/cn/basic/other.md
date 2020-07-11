Other irregularities
====================


## warning

- Root EOS

```
key = 1;
```

- 不一致的 EOS

```
key = {
  one = 1;
  two = 2,
}
```


- inline 时多余的 EOS

```
case1 = {one = 1;}
case2 = ("string",)

## error

- 多重 EOS

```
key = 1;;
```





