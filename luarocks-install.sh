cd ~

sudo apt -y install unzip make

wget http://luarocks.github.io/luarocks/releases/luarocks-3.0.4.tar.gz
wget http://luarocks.github.io/luarocks/releases/luarocks-3.0.4.tar.gz.asc

# verify pgp signature
gpg luarocks-3.0.4.tar.gz.asc
# for "no public key" error. get public key with rsa key id?
# In my case, this is how it looked
gpg --keyserver pgpkeys.mit.edu --recv-key 3FD8F43C2BB3C478
# verify again now. it should work
gpg luarocks-3.0.4.tar.gz.asc

tar -xvzf luarocks-3.0.4.tar.gz

cd ~/luarocks-3.0.4

./configure \
	--lua-suffix=jit \
	--with-lua=/usr/local/openresty/luajit \
	--with-lua-include=/usr/local/openresty/luajit/include/luajit-2.1

make build
sudo make install