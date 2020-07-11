RFC14: Exponent
===============


```antlr
exponent : left = key Assign right = exponent  # ExponentAssign
exponent : signed Exponent signed;
signed   : integer | decimal;
Exponent : 'e' | 'E';
```

