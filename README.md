# 关于BUG环境复现方法

## 构建Docker镜像

docker build . -t memleak:1.0

## 复现方法

docker run --rm -it memleak:1.0
然后观察内存变化
