**Block 1**

mkdir iprojekt

cd ~/iprojekt

cat > home_animals

cat > pack_animals

cat home_animals pack_animals > animals

cat animals

mv animals humans_friends

ls -ali


**Block 2**

cd ..

mkdir iprojekt_system

cd ~/iprojekt

mv humans_friends ~/iprojekt_system

cd ~/iprojekt_system

ls -ali


**Block 3**

sudo wget https://dev.mysql.com/get/mysql-apt-config_0.8.23-1_all.deb

sudo dpkg -i mysql-apt-config_0.8.23-1_all.deb

sudo apt-get update

sudo apt-get install mysql-server

**Block 4**

sudo wget https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-ce-cli_20.10.13~3-0~ubuntu-jammy_amd64.deb

sudo dpkg -i docker-ce-cli_20.10.13~3-0~ubuntu-jammy_amd64.deb

sudo dpkg -r docker-ce-cli