# Installation commands Arch Linux:

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
sudo pacman -S glew libglvnd

git clone https://github.com/stetre/moongl

cd moongl

make

sudo make install
```

## MoonAL - Audio
```
sudo pacman -S openal

git clone https://github.com/stetre/moonal

cd moonal

make

sudo make install
```

## MoonGLFW - Windowing Library
```
sudo pacman -S glfw-x11

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