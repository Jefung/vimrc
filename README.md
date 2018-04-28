# vimrc:个人习惯配置，仅供参考
1. [vim安装](#vim安装)
2. [目录介绍](#目录介绍)

vim安装
----------

* **编译安装**
	*  [获取vim源码](https://github.com/vim/vim) 
	*  编译:
		语法:

		```
		./configure \
		--with-features=huge \
		--enable-multibyte \
		--enable-rubyinterp=yes \
		--enable-pythoninterp=yes \
		--with-python-config-dir=/usr/lib/python2.7 \
		--enable-perlinterp=yes \
		--enable-luainterp=yes \
		--prefix=/usr/local/vim8.0
		```
		`--prefixi` 是安装路径 `with-python-config-dir`　是python路径

	*  安装vim:
	make install

*  使用系统软件包管理安装vim:
	* ps: centos安装vim-X11(基于GUI的vim,　其他类似)可以带上 `+clipboard` 特性,便于以后使用全局复制粘贴

## 目录介绍
* .vim: 
	* color: vim主题样式存放目录
	* spell: 开启 `:set spell`　后保存用户存储的正确拼写单词. ps:[vim spell介绍](http://vimcdoc.sourceforge.net/doc/spell.html)
* .vimrcs:　配置文件，会被 `.vimrc`　加载
	* .plugin: 插件配置文件(用户自定义)
* .vimrc: 用户vim配置文件
* .ycm_extra_conf.py: [YouComplete自动补全插件](https://github.com/Valloric/YouCompleteMe/blob/master/README.md)安装后的配置文件
* install.sh:　快速安装脚本，仅仅单纯的建立软链接
* .clang-format: 用于clang-format程序格式化cpp/c时的设置,比如函数括号在函数名后面
