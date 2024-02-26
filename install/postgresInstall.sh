sudo pacman -Syyu
sudo pacman -S postgresql
name=$(whoami)
echo "Initializing database files\n\n"
sudo -iu postgres initdb --locale $LANG -E UTF8 -D '/var/lib/postgres/data'
echo "Database files initialized\n\n"
# exit
echo "Starting services\n\n"
sudo systemctl start postgresql
sudo systemctl enable postgresql
echo "Granting user's access\n\n"
psql -U postgres -c "CREATE USER $name WITH ENCRYPTED PASSWORD '$name';"
psql -U postgres -c "CREATE DATABASE $name;"
psql -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE $name TO $name;"
psql -U postgres -c "ALTER USER $name WITH SUPERUSER;"
