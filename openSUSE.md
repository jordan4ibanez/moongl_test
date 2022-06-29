# Installation commands openSUSE TumbleWeed:

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
sudo zypper install Mesa-libGL-devel glew-devel

git clone https://github.com/stetre/moongl

cd moongl

make

sudo make install
```

## MoonAL - Audio
```
sudo zypper install libopenal1 openal-soft-data

git clone https://github.com/stetre/moonal

cd moonal

make

sudo make install
```

## MoonGLFW - Windowing Library
```
sudo zypper install libglfw-devel

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