# Reasonix Go — 编译产物

预编译的 Reasonix Go 版本 & 快速安装脚本。

源码: [serend11/reasonix_go](https://github.com/serend11/reasonix_go)

## 一键安装

```bash
curl -fsSL https://raw.githubusercontent.com/Katsro/reasonix-go-dist/main/install.sh | bash
```

安装后获得 `reasonixgo` 全局命令。

## 手动安装

从 [Releases](https://github.com/Katsro/reasonix-go-dist/releases) 下载对应平台的二进制，放到 `~/.local/bin/` 并创建 `reasonixgo` 软链接。

## 编译信息

- Go 版本: 1.26.3
- 平台: android/arm64
- 构建: CGO_ENABLED=0
