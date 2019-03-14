import os
from time import gmtime, strftime
from termcolor import colored, cprint
import sys


def print_with_blue(msg):
    text = colored(msg, 'blue')
    print(text)


def print_with_red(msg):
    text = colored(msg, 'red')
    print(text)


def exists_file(filename):
    return os.path.exists(filename) or os.path.islink(filename)


def backup_and_rm_file(filename):
    time = strftime("%Y%m%d_%H_%M_%S", gmtime())
    new_filename = "{filename}_backup_{time}".format(filename=filename, time=time)
    os.rename(filename, new_filename)
    print_with_blue("backup {filename} -> {new_filename}".format(filename=filename, new_filename=new_filename))


if __name__ == "__main__":


    if sys.version_info[0] < 3:
        print_with_red("python version must be 3.*.*")
    # 把需要建立的软链接写在这
    # key : 源路径
    # value : 软链接所在目录
    d = {}
    home = os.path.expanduser("~")
    print(home)
    # d["src"] = "des"
    d[".clang-format"] = home
    d[".vimrc"] = home
    d['.vimrcs'] = home
    d['.vim'] = home
    # d['.ycm_extra_conf.py'] = os.path.join(home,"/repos/vimrc/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm")
    # d['.gitconfig'] = home
    # d['.tmux.conf'] = home


    for src, des in d.items():
        des = os.path.join(des,src)
        if not exists_file(src):
            print_with_red("{} is not exists, pass it".format(src))
            continue
        if exists_file(des):
            print_with_blue("{} is exists, now backup it".format(des))
            backup_and_rm_file(des)
        os.symlink(os.path.abspath(src), des)
