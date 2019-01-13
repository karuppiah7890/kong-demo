cd ~

wget -qO - https://openresty.org/package/pubkey.gpg | sudo apt-key add -
sudo apt -y install software-properties-common
sudo add-apt-repository -y "deb http://openresty.org/package/ubuntu $(lsb_release -sc) main"
sudo apt update
sudo apt -y install openresty