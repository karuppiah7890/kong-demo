cd ~

# install postgres
sudo apt update
sudo apt -y install postgresql-10

# check if it's running
systemctl status postgresql

# connect to the db and see the list of databases
sudo su - postgres
psql -c "\l"
exit
