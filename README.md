# moongl_test

**A learning experience for moongl**

Probably only going to run on Linux


# Installation commands Ubuntu 22.04:

## Prequisites - Lua VM

```
wget https://www.lua.org/ftp/lua-5.4.4.tar.gz

tar -zxpvf lua-5.4.4.tar.gz

cd lua-5.4.4/

make linux

sudo make install

```


## MoonGL - OpenGL - Needs another run through in virtual machine
```
sudo apt install libopengl-dev libgl-dev libglew-dev

git clone https://github.com/stetre/moongl

cd moongl

make

sudo make install
```

## MoonAL - Audio
```
sudo apt install libopenal-dev

git clone https://github.com/stetre/moonal

cd moonal

make

sudo make install
```

## MoonGLFW - Windowing Library
```
sudo apt install libglfw3-dev

git clone https://github.com/stetre/moonglfw

cd moonglfw

make

sudo make install
```

## MoonFonts
```
git clone https://github.com/stetre/moonfonts

cd moonfonts

make

sudo make install
```