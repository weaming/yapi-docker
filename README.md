# YAPI

在容器内运行 YApi。魔改版本已亲测可运行。

- 修改自 https://github.com/jinfeijie/yapi
- fix install: https://github.com/YMFE/yapi/issues/2583#issuecomment-1184030925

## 使用步骤

1. `make && docker-compose up -d`
2. 打开 http://127.0.0.1:3000 默认密码 `ymfe.org`
3. 可通过安装 chrome 插件直接测试接口 https://github.com/YMFE/cross-request
4. [YApi 新版如何查看 HTTP 请求数据](https://juejin.cn/post/6844903795743260685)

## 注意事项

1. 如果 mongo 重启出问题，可选择已保存的数据文件夹再重试
2. 可在 https://registry.npmmirror.com/yapi-vendor 查看可用版本，然后修改 docker-compose.yml
