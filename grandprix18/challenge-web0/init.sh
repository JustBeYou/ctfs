shopt -s dotglob

cp -R /app-org/* /app
echo "Install component for app"
(cd /app
rm -rf vendor && rm -rf composer.lock
composer install  --no-plugins --no-scripts)
echo "REconfig"
# no mysql == no sqli
rm -rf "/opt/lampp/phpmyadmin/config.inc.php"
rm -rf /opt/lampp/temp/*
chown root:root  -R /app
find /app/ -type d -exec chmod 755 {} \;
find /app/ -type f -exec chmod 644 {} \;
rm -rf /app/users
mkdir /app/users
chown root:root /app/users
chmod 1733 /app/users/

echo "Cronjob"
crontab -l > mycron
echo "*/10 * * * * rm -rf /opt/lampp/temp/* && rm -rf /app/users/*" >> mycron
crontab mycron
rm mycron
service cron start
echo "Start XAMPP"
/opt/lampp/lampp startapache
echo "Hold on..."
tail -F /dev/null

