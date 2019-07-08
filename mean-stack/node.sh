mv /tmp/node.service /etc/systemd/system/
appdir="/opt/app"
echo "Creating the application directory"
if ! [ -d $appdir ]; then
    mkdir $appdir
fi
echo "Installing the EPEL repository"
yum -y install epel-release
echo "Install Node.js"
yum -y install nodejs
echo "Deploying the application files"
cp -r /vagrant/appfiles/* $appdir/
echo "Availing the prerequisites"
cd $appdir
npm install
echo "Making the server.js file executable"
chmod +x server.js
echo "Starting the application"
systemctl start node
systemctl enable node