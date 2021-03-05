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

### 3. 安装 [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe) 插件
> **YouCompleteMe 为选配，基本配置要求**： 1. vim 7.4.1578+ 2. python3

1. 开启 `.vimrc` 文件的配置 YouCompleteMe 插件安装配置：
> 打开修改 `$ vim ~/.vimrc` 文件；
>
> 去掉 21 行注释 `"Plugin 'Valloric/YouCompleteMe' "YouCompleteMe requires Vim 7.4.1578+, python3"`。

2. 通过 [Vundle](https://github.com/VundleVim/Vundle.vim) 安装 YouCompleteMe 插件
>  打开 vim，`$ vim`；
>
>  vim 中输入 `:PluginInstall` 安装配置好的 vim 插件的，包括 YouCompleteMe；
>
>  编译 YouComplete 插件，`$ cd ~/.vim/bundle/YouCompleteMe && bash install.sh --all`；
>
>  重启 vim 让配置生效。

### 4. 兼容一些低版本的 Linux 系统和 VIm
> 假如你在按照以上的过程中，由于配置导致 vim 出现起不来的错误，可以用低版本的配置去覆盖
>
> `$ cd _low_version && bash setup.sh`
>
> 安装过程中选择 `yes` 覆盖原有的配置即可。

### 5. YouCompleteMe 添加 Rust 自动补全
1. 安装 Vundle 后，打开 `~/.vimrc` 添加 `Plugin 'Valloric/YouCompleteMe'`，然后打开 vim 执行 `:PluginInstall`
>
> 更新 YouCompleteMe 使用 `:PluginUpdate`。

2. 支持 rust 语法  `cd ~/.vim/bundle/YouCompleteMe && ./install.py --racer-completer`

3. 下载安装与 `rustc --version` 版本一致的源代码到本地目录 `/usr/local/` 下，并添加引用
>
> 3.1 下载 rust 源码并解压 ` mkdir -p /usr/local/rust && cd /usr/local/rust &&  wget https://github.com/rust-lang/rust/archive/1.41.1.tar.gz && tar -zxvf 1.41.1.tar.gz && rm -rf 1.41.1.tar.gz`
>
> 3.2 打开 `~/.vimrc` 添加源码路径，`let g:ycm_rust_src_path = '/usr/local/rust/rustc-1.41.1/src'`

### 版本说明
1. v1.0 初始化。
2. v2.0 增加默认安装 [Vundle](https://github.com/VundleVim/Vundle.vim) 管理 vim 插件，增加选配插件  [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe) 的安装。

### 备注
#### Error-1 :
```
YouCompleteMe unavailable: requires Vim compiled with Python (3.5.1+) support.
Press ENTER or type command to continue
```
> `$apt install vim-gtk `

#### Python3.5 Needed!!
> [Python 3.7 install](https://raw.githubusercontent.com/xingangshi/config_tools/master/000_gists_bak/python3_install.sh)

#### Error-2 :
假如选择安装 YouComplete， 在 vim 界面执行 `:PluinInstall` 可能会报如下的错误
```
:PluginSearcherver SHUT DOWN (restart with ':YcmRestartServer'). YCM core library not detected; you need to compile YCM before using it. Follow the instructions in the document
```
##### 解决方案：
> 退出 vim，执行以命令 `$ cd ~/.vim/bundle/YouCompleteMe && bash install.sh` 或者 `$ cd ~/.vim/bundle/YouCompleteMe && bash install.sh --all`
>
> 确保以上命令执行没有报错的情况下，执行 `$vim` 进入 vim 不报错，即可。
