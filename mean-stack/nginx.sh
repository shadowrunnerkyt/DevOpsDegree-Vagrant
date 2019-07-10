webdir=/usr/share/www/html
if ! [ -d $webdir ]; then
    mkdir -p $webdir
fi
echo "Installing EPEL"
yum -y install epel-release
echo "Installing nginx"
yum -y install nginx
echo "Deploying the configuration file"
cp /vagrant/webfiles/etc/nginx/nginx.conf /etc/nginx
echo "Deploy the web files"
cp -r /vagrant/webfiles/usr/share/www/html/* /usr/share/www/html/
echo "Start the web server"
systemctl start nginx
systemctl enable nginx