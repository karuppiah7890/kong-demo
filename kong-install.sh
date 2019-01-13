cd ~
sudo apt -y install gcc libssl-dev m4

git clone http://github.com/Kong/kong.git

cd kong

# https://itschr.is/installing-luasec-with-luarocks-on-ubuntu/
sudo luarocks install luasec OPENSSL_LIBDIR=/usr/lib/x86_64-linux-gnu/
sudo make install

sudo mkdir -p /etc/kong
sudo cp kong.conf.default /etc/kong/kong.conf

sudo su - postgres
psql -c "CREATE USER kong WITH ENCRYPTED PASSWORD 'kong'; CREATE DATABASE kong OWNER kong;"
exit

# change the pg_password configuration in /etc/kong/kong.conf
sudo vi /etc/kong/kong.conf

cd ~
sudo mv ~/kong /usr/local/kong

# add /usr/local/kong/bin to the PATH environment variable like this -
# export PATH=$PATH:/usr/local/kong/bin
vi ~/.bashrc
source ~/.bashrc

ulimit -n 4096

# check kong binary is accessible
kong

# run migrations
kong migrations bootstrap

# start kong
kong start

# check kong is accessible using curl
curl http://localhost:8001/
