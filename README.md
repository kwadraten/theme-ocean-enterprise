# Theme Ocean for Enterprise

Theme Ocean for Enterprise 是适用于开源建站工具 [Halo](https://halo.run) 的主题。

本主题是在 Halo 知识库主题 [Ocean](https://github.com/halo-dev/theme-earth.git) 的基础上二次开发所得的变体，为 Ocean 增加了适用于企业官网的落地页，可供搭建企业官网。

## 使用方式
1. 下载Release当中的dist.zip，然后在halo的主题管理页面上传。
2. 安装和更新方式可参考：https://docs.halo.run/user-guide/themes

## 开发

参见halo的主题开发文档：<https://docs.halo.run/developer-guide/theme/prepare>

基本步骤如下：

1. 如果使用Linux在本地安装了halo，可直接将git仓库拉取到 `~/halo/themes/` 文件夹下。
2. 在代码文件夹中执行 `pnpm install` 安装依赖。
3. 执行 `pnpm dev` 进入热重载。
4. 运行halo。

注意：如果使用windows或者docker，则可将代码拉取到任意位置，然后选择构建后上传 `dist.zip` 的方式。

## 构建

1. （推荐）如果使用Linux或WSL，可安装GNU make，然后执行 `make build`，构建产物为 `dist.zip`。
2. 如果使用Windows，请先确保电脑上安装了7zip或Bandizip，并且已经将相关程序加入环境变量。在此基础上，请执行 `./pack.ps1`。
