# to be able to set wildcard variables

with bass:
```shell
$> omf install bass
$> bash export SOMEVAR=SOMEVAL
```

with wildcards:
```shell
$> bass export "GOPRIVATE=github.com/someuser/*"
```
