#!/bin/bash

# Variables
SQL_DIR="./tables"  # Directory where all your .sql files are stored
MASTER_SQL="master.sql"        # Name of the master file to be created
SCRIPT_NAME="run_all_sql.sh"   # The name of this script
MYSQL_USER="yutharsan"         # Replace with your MySQL username
MYSQL_PASS="0585"              # Replace with your MySQL password
DATABASE="test_script"         # Replace with your database name

# Expand the tilde (~) to the full home directory path
SQL_DIR=$(eval echo $SQL_DIR)

# Check if the directory exists
if [ ! -d "$SQL_DIR" ]; then
    echo "Error: Directory $SQL_DIR does not exist."
    exit 1
fi

# Create/empty the master.sql file in the directory
> "$SQL_DIR/$MASTER_SQL"

# Drop the database if it exists, then recreate it
echo "Dropping and recreating the database: $DATABASE"
sudo mysql -u "$MYSQL_USER" -p"$MYSQL_PASS" -e "DROP DATABASE IF EXISTS $DATABASE; CREATE DATABASE $DATABASE;"

# Check if there are any .sql files to process
shopt -s nullglob
sql_files=("$SQL_DIR"/*.sql)
if [ ${#sql_files[@]} -eq 0 ]; then
    echo "No SQL files found in $SQL_DIR"
    exit 1
fi

# Loop through all .sql files in the directory and append to master.sql, excluding master.sql and the script itself
for sql_file in "${sql_files[@]}"; do
    # Exclude master.sql and the script itself
    if [ "$(basename "$sql_file")" != "$MASTER_SQL" ] && [ "$(basename "$sql_file")" != "$SCRIPT_NAME" ]; then
        echo "Adding $sql_file to $MASTER_SQL"
        echo "source $sql_file;" >> "$SQL_DIR/$MASTER_SQL"
    fi
done

# Execute the master.sql file using MySQL
sudo mysql -u "$MYSQL_USER" -p"$MYSQL_PASS" "$DATABASE" < "$SQL_DIR/$MASTER_SQL"

# Remove the master.sql file
rm "$SQL_DIR/$MASTER_SQL"

echo "Execution of all SQL files complete."
