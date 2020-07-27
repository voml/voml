
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

### first class import

当前版本的 import 语句只能位于整个文件最上方

first class import 使得 import 能作为值放在等号右边

### include 宏

include 一个路径, 被引入的路径原封不动的被读取到语句的位置.



