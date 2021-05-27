从上往下，变量后面用到时再展开
`
VERSION = 5
PATCHLEVEL = 12
SUBLEVEL = 0
EXTRAVERSION =
NAME = Frozen Wasteland
`

```makefile
$(if $(filter __%, $(MAKECMDGOALS)), \
	$(error targets prefixed with '__' are only for internal use))
```