## vim_installer

---

### 1. 说明

一个简易的常用 VIM 配置及插件的快速安装库。


### 2. 安装


#### 2.1 Linux 或 MacOS 下安装

##### 2.1.1 分步安装
1. `git clone https://github.com/XingangShi/vim_installer.git`
2. `cd vim_installer`
3. `bash setup.sh`

##### 2.1.2 一键安装

```bash
git clone https://github.com/XingangShi/vim_installer.git && cd vim_installer && bash setup.sh && cd -
```

#### 2.2 Windows 下安装
1. 先安装 Windows 下类 Linux 环境
    * MinGW，下载地址：https://osdn.net/projects/mingw/releases/
    * Cygwin，下载地址：http://www.cygwin.com/

2. 打开 MinGW 或 Cygwin 终端

3. 执行 2.1.1 或 2.1.2 命令

### 3 安装 [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe) 插件
> **YouCompleteMe 基本配置要求**： 1. vim 7.4.1578+ 2. python3

1. `$ vim`；
2. vim 中输入 `:PluginInstall` 安装配置好的 vim 插件的，包括 YouCompleteMe；
3. `$ cd ~/.vim/bundle/YouCompleteMe && bash install.sh --all`；
4. 重启 Terminal 即可。

### 4. 版本说明
1. v1.0 初始化。
2. v2.0 增加 [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe) 的安装。
