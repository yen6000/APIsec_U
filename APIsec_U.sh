#! /bin/sh
sudo ls
clear
cat https://github.com/yen5004/APIsec_U/blob/main/ascii_art
cat ascii_art
echo ""
echo ""
echo ""
echo "Wecome to the APIsec_U start up script!"
echo "This tool will install crAPI & vAPI, along with other API tools"
echo "The script begins with making a folder called MailMan in your Downloads folder"
echo "We follow along the instructional video provided and also make a Lab folder"
echo "Begining process!"
echo "for more information on this process or any program, visit: "
echo "https://university.apisec.ai/products/api-penetration-testing/categories/2150251486/posts/2157710611"
sleep 3s

sudo apt -y update && sudo apt upgrade -y
sudo mkdir -p $HOME/lab
sudo mkdir -p $HOME/lab/crapi
sudo mkdir -p $HOME/opt
sudo mkdir -p $HOME/opt/zaproxy
sudo mkdir -p $HOME/MailMan

cd $HOME/MailMan
echo "Folders are done! Moving on to install tools!!!"
sudo apt -y install unzip
sudo apt -y install make
sudo apt -y install firefox
sudo apt -y install python3
sudo apt -y install python3-pip
echo "#############################"
echo "#############################"
echo "## Knock knock.. Enter..   ##"
echo "## THE POSTMAN!!           ##" 
echo "#############################"
echo "#############################"
sleep 4s
cd $HOME/opt
sudo wget https://dl.pstmn.io/download/latest/linux64 -O postman-linux-x64.tar.gz && sudo tar -xvzf postman-linux-x64.tar.gz -C $HOME/opt && sudo ln -s $HOME/opt/Postman/Postman /usr/bin/postman
echo "You've got mail!"
sleep 2s

echo "You have python installed right?"
echo "I trust you, giving you some Swag"
sudo pip3 install mitmproxy2swagger
echo "Now you got some swag!"

echo "Getting Git again?"
cd $HOME/opt
sudo apt -y install git
echo "Git sucess"

echo "Grabbing my hardhat for docker, see ya at the next break"
cd $HOME/opt
sudo apt -y install docker-compose
sudo apt -y install docker.io docker-compose
echo "docker-compose sucess"

echo "still here, installing Go, brb"
cd $HOME/opt
sudo apt -y install golang-go
echo "Golang sucess"

echo "installing JWT_TOOL"
cd $HOME/opt
sudo git clone https://github.com/ticarpi/jwt_tool
cd $HOME/opt/jwt_tool
python3 -m pip install termcolor cprint pycryptodomex requests
echo "Making an alias for jwt_tool.py"
sudo chmod +x jwt_tool.py
sudo ln -s $HOME/opt/jwt_tool/jwt_tool.py /usr/bin/jwt_tool

echo "Dont mind me, chasing Kiterunner for install:"
cd $HOME/opt
sudo git clone https://github.com/assetnote/kiterunner.git
cd $HOME/opt/kiterunner
sudo make build
sudo ln -s $HOME/opt/kiterunner/dist/kr /usr/bin/kr

echo "Pass the Arjun!"
cd $HOME/opt
sudo git clone https://github.com/s0md3v/Arjun.git

echo "Bringing in the WASP!" 
cd $HOME/opt
sudo apt -y install zaproxy
#not in lib anymore
#attempting this way:
cd $HOME/opt/zaproxy
sudo wget https://github.com/zaproxy/zaproxy/releases/download/v2.12.0/ZAP_2_12_0_unix.sh
sudo chmod +x ZAP_2_12_0_unix.sh
sudo bash ZAP_2_12_0_unix.sh

echo "Installing Useful Wordlists"
#SecLists (https://github.com/danielmiessler/SecLists)
cd $HOME/opt
sudo wget -c https://github.com/danielmiessler/SecLists/archive/master.zip -O SecList.zip \
&& sudo unzip SecList.zip \
&& sudo rm -f SecList.zip

echo "Installing Hacking-APIs:"
cd $HOME/opt
sudo wget -c https://github.com/hAPI-hacker/Hacking-APIs/archive/refs/heads/main.zip -O HackingAPIs.zip \
&& sudo unzip HackingAPIs.zip \
&& sudo rm -f HackingAPIs.zip

cd $HOME/lab/crapi
sudo curl -o docker-compose.yml https://raw.githubusercontent.com/OWASP/crAPI/main/deploy/docker/docker-compose.yml
sudo docker-compose pull
sudo docker-compose -f docker-compose.yml --compatibility up -d
echo "Testing crAPI webpage on FireFox..."
sleep 2s
echo "Opening FireFox now"
sudo firefox http://127.0.0.1:8888 &
echo "Showing main landing page of crAPI on FF"
sleep 3s
echo "Testing Mailhog webpage..."
sudo firefox --new-tab http://127.0.0.1:8025 &
sleep 3s
echo "Showing main landing page of Mailhog on FF"
sleep 3s

echo "Begin installing vAPI"
cd $HOME/opt
sudo git clone https://github.com/roottusk/vapi.git
cd $HOME/opt/vapi
sudo docker-compose up -d
echo "Testing vAPI webpage..."
sudo firefox --new-tab http://127.0.0.1/vapi &
echo "Showing landing page of vapi on FF"

echo "showing docker containers that are running..."
echo "by using the command sudo docker-compose ps"
sleep 3s
sudo docker-compose ps

cd $HOME/MailMan
sudo wget https://repo1.maven.org/maven2/org/python/jython-standalone/2.7.3/jython-standalone-2.7.3.jar

echo "Need to tidy up a bit"
sudo apt -y update && sudo apt -y upgrade

echo "**********************************************************************************************************************"
echo "**********************************************************************************************************************"
echo "**********************************************************************************************************************"
echo "*****      Add extnesions to burpsuite, follow video                                                            *****"
echo "*****      Proceedures are at time 4:37                                                                         *****"
echo "*****      https://university.apisec.ai/products/api-penetration-testing/categories/2150251486/posts/2157710611 *****"
echo "*****      jypthon is located in folder: $HOME/MailMan                                                          *****"
echo "*****      extensions to add: autorise                                                                          *****" 
echo "*****                :::WARNING WARNING WARNING:::                                                              *****"
echo "*****    Once ZAP is installed, make sure to navigate to the Manage Add-Ons (CTRL+U)                            *****"
echo "*****     Make sure to apply updates for the Fuzzer and OpenAPI Support                                         *****"
echo "*****                :::END WARNING ::: END WARNING :::                                                         *****"
echo "*****      here is your checklist:                                                                              *****"
echo "*****      foxy proxy for Firefox                                                                               *****"
echo "*****      Add Postman and Burpsuite proxy settings                                                             *****"
echo "*********************************************************************************************************************"
echo "*********************************************************************************************************************"
echo "*********************************************************************************************************************"
echo "All done! End of install"
echo "I need to reboot, thanks for all your hard work"
