#!/bin/bash

# Variables
MYSQL_USER="yutharsan"
MYSQL_PASS="0585"
DATABASE="c_ecommerce"
DIRECTORIES=("schema" "views" "procedures" "triggers" "dev" "functions" "indexes" "data")

# Export variables for use in execute_sql_dir.sh
export MYSQL_USER
export MYSQL_PASS
export DATABASE

# Create a temporary MySQL option file
MYSQL_OPTS=$(mktemp)
cat << EOF > "$MYSQL_OPTS"
[client]
user=$MYSQL_USER
password=$MYSQL_PASS
EOF

# Drop and recreate the database
echo "Dropping and recreating the database: $DATABASE"
sudo mysql --defaults-file="$MYSQL_OPTS" <<EOF
DROP DATABASE IF EXISTS $DATABASE;
CREATE DATABASE $DATABASE;
USE $DATABASE;
EOF

# Remove the temporary MySQL option file
rm "$MYSQL_OPTS"

# Execute SQL files in each directory
for dir in "${DIRECTORIES[@]}"; do
    ./run.sh "$dir"
done

rm master_*

echo "Execution of all SQL files in all directories complete."