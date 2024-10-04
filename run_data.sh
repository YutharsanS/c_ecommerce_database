#!/bin/bash

# Variables
SQL_DIR="./data/data"  # Directory where all your .sql files are stored
MASTER_SQL="master.sql"        # Name of the master file to be created
SCRIPT_NAME="run_data.sh"   # The name of this script

# Expand the tilde (~) to the full home directory path
SQL_DIR=$(eval echo $SQL_DIR)

# Check if the directory exists
if [ ! -d "$SQL_DIR" ]; then
    echo "Error: Directory $SQL_DIR does not exist."
    exit 1
fi

# Create/empty the master.sql file in the directory
> "$SQL_DIR/$MASTER_SQL"

# Loop through all .sql files in the directory and append to master.sql, excluding master.sql and the script itself
for sql_file in "$SQL_DIR"/*.sql; do
    # Exclude master.sql and the script itself
    if [ "$(basename "$sql_file")" != "$MASTER_SQL" ] && [ "$(basename "$sql_file")" != "$SCRIPT_NAME" ]; then
        echo "Adding $sql_file to $MASTER_SQL"
        echo "source $sql_file;" >> "$SQL_DIR/$MASTER_SQL"
    fi
done

# Execute the master.sql file using MySQL
sudo mysql -u "$MYSQL_USER" -p"$MYSQL_PASS" -e "USE $DATABASE; source $SQL_DIR/$MASTER_SQL;"

echo "Execution of all SQL files complete."
