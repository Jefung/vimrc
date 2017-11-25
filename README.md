# vimrc:个人习惯配置，仅供参考
- [配置要求](#require)
- [vim编译安装](#vim-compile-install)
- [plugins intro](#plugin-intro)



# require
---------
- 配置要求：
	   - vim安装了python2或者3

# vim-compile-install
- vim编译安装
	1. download vim from git
	2. compile vim:
	syntax:
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
	3. install vim:
	make install

