#!/bin/bash

# Check if directory name is provided
if [ $# -eq 0 ]; then
    echo "Please provide a directory name as an argument."
    exit 1
fi

# Variables
DIR_NAME="$1"
SQL_DIR="./$DIR_NAME"
MASTER_SQL="master_${DIR_NAME}.sql"
MYSQL_USER="${MYSQL_USER:-yutharsan}"
MYSQL_PASS="${MYSQL_PASS:-0585}"
DATABASE="${DATABASE:-script}"

# Check if the directory exists
if [ ! -d "$SQL_DIR" ]; then
    echo "Error: Directory $SQL_DIR does not exist."
    exit 1
fi

# Drop and recreate the database
echo "Dropping and recreating the database: $DATABASE"
sudo mysql -u "$MYSQL_USER" -p"$MYSQL_PASS" <<EOF
DROP DATABASE IF EXISTS $DATABASE;
CREATE DATABASE $DATABASE;
EOF

# Create/empty the master SQL file
> "$MASTER_SQL"

# Check if there are any .sql files to process
shopt -s nullglob
sql_files=("$SQL_DIR"/*.sql)
if [ ${#sql_files[@]} -eq 0 ]; then
    echo "No SQL files found in $SQL_DIR"
    exit 1
fi

# Loop through all .sql files in the directory and append to master SQL
for sql_file in "${sql_files[@]}"; do
    echo "Adding $(basename "$sql_file") to $MASTER_SQL"
    echo "source $sql_file;" >> "$MASTER_SQL"
done

# Execute the master SQL file
echo "Executing SQL files in $DIR_NAME"
sudo mysql -u "$MYSQL_USER" -p"$MYSQL_PASS" "$DATABASE" < "$MASTER_SQL"

# Remove the master SQL file
rm "$MASTER_SQL"

echo "Execution of SQL files in $DIR_NAME complete."