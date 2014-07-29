Installation
------------

### OS X
```
git clone --recursive https://github.com/m1sh/dotfiles.git ~/.vim/
```
### Windows
```
git clone --recursive https://github.com/m1sh/dotfiles.git vimfiles/
```

Symlinks
--------

### OS X
```
ln -s ~/.vim/vimrc ~/.vimrc
```
### Windows
```
mklink .vimrc vimfiles\vimrc
```


Registering new submodule
-------------------------

```
git submodule init
```

Updating bundles
----------------

```
git submodule update --recursive
```

Requirements
------------

* Python: for UltiSnips
* Lua: for NeoComplete
