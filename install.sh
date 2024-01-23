#!/bin/bash

sudo add-apt-repository multiverse -y; sudo dpkg --add-architecture i386 ; sudo apt update -y
sudo apt-get remove needrestart -y

echo steam steam/license note '' | sudo debconf-set-selections
echo steam steam/question select "I AGREE" | sudo debconf-set-selections
sudo apt install steamcmd -y

mkdir -p ~/.steam/sdk64/
steamcmd +login anonymous +app_update 2394010 validate +quit
steamcmd +login anonymous +app_update 1007 +quit
cp ~/Steam/steamapps/common/Steamworks\ SDK\ Redist/linux64/steamclient.so ~/.steam/sdk64/

cat <<EOF >> run.sh
#!/bin/bash

cd /home/steam/Steam/steamapps/common/PalServer

(./PalServer.sh >> /tmp/PalServer.log 2>&1 &)
EOF

chmod +x run.sh
mv run.sh /home/steam/Steam/steamapps/common/PalServer

cat <<EOF >> pal-server.service
[Unit]
Description=pal-server.service

[Service]
Type=forking
User=steam
ExecStart=/home/steam/Steam/steamapps/common/PalServer/run.sh

[Install]
WantedBy=multi-user.target
EOF

sudo mv pal-server.service /usr/lib/systemd/system/
sudo systemctl enable pal-server
sudo systemctl start pal-server
