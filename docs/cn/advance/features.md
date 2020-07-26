
### 字典引用继承

```toml
raw = {a = 1}
new = $raw {
    b = 2,
}

new_raw = {
    a = 1, 
    b = 2,
}
```

### 列表引用继承

```toml
raw = [1, 2, 3]
new = $raw [4, 5, 6]

new_raw = [1, 2, 3, 4, 5, 6]
```

###

