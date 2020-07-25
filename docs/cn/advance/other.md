Other irregularities
====================


## warning

- Root EOS

```toml
key = 1;
```

- 不一致的 EOS

```toml
key = {
  one = 1;
  two = 2,
}
```


- inline 时多余的 EOS

```toml
case1 = {one = 1;}
case2 = ("string",)
```

## error

- 多重 EOS

```toml
key = 1;;
```





