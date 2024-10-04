#vairables
export MYSQL_USER="yutharsan"         # Replace with your MySQL username
export MYSQL_PASS="0585"              # Replace with your MySQL password
export DATABASE="test_script"

# Drop the database if it exists, then recreate it
echo "Dropping and recreating the database: $DATABASE"
sudo mysql -u "$MYSQL_USER" -p"$MYSQL_PASS" -e "DROP DATABASE IF EXISTS $DATABASE; CREATE DATABASE $DATABASE; USE $DATABASE;"

./run_schema.sh
./run_data.sh
