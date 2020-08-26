容器包括字典与列表



## warning


## error

- 禁止重复的 EOS

```arc
error1 = [1,2,3,,]

error2 = [1,,2,3]
```

- 禁止起始 EOS

```arc
error = [,1,2,3]
```
