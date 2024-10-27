#!/bin/bash

# Check if directory name is provided
if [ $# -eq 0 ]; then
    echo "Please provide a directory name as an argument."
    exit 1
fi

# Variables
DIR_NAME="$1"
SQL_DIR="$(pwd)/$DIR_NAME"
MASTER_SQL="$(pwd)/master_${DIR_NAME}.sql"
MYSQL_USER="${MYSQL_USER:-yutharsan}"
MYSQL_PASS="${MYSQL_PASS:-0585}"
DATABASE="${DATABASE:-c_ecommerce}"

# Create a temporary MySQL option file
MYSQL_OPTS=$(mktemp)
cat << EOF > "$MYSQL_OPTS"
[client]
user=$MYSQL_USER
password=$MYSQL_PASS
EOF

# Check if the directory exists
if [ ! -d "$SQL_DIR" ]; then
    echo "Error: Directory $SQL_DIR does not exist."
    rm "$MYSQL_OPTS"
    exit 1
fi

# Ensure the database exists
sudo mysql --defaults-file="$MYSQL_OPTS" <<EOF
CREATE DATABASE IF NOT EXISTS $DATABASE;
USE $DATABASE;
EOF

# Create/empty the master SQL file
> "$MASTER_SQL"

# Check if there are any .sql files to process
shopt -s nullglob
sql_files=("$SQL_DIR"/*.sql)
if [ ${#sql_files[@]} -eq 0 ]; then
    echo "No SQL files found in $SQL_DIR"
    rm "$MYSQL_OPTS"
    exit 1
fi

# Loop through all .sql files in the directory and append to master SQL
for sql_file in "${sql_files[@]}"; do
    if [ "$(basename "$sql_file")" != "$MASTER_SQL" ]; then
        echo "Processing $(basename "$sql_file")..."
        if sudo mysql --defaults-file="$MYSQL_OPTS" "$DATABASE" < "$sql_file"; then
            echo "Successfully executed $(basename "$sql_file")"
        else
            echo "Error executing $(basename "$sql_file")"
            # Optionally, you can add:
            # continue   # to skip to next file
            # or
            # exit 1    # to stop processing completely
        fi
    fi
done

# Execute the master SQL file
echo "Executing SQL files in $DIR_NAME"
sudo mysql --defaults-file="$MYSQL_OPTS" "$DATABASE" < "$MASTER_SQL"

# Remove the master SQL file and the temporary MySQL option file
rm "$MASTER_SQL" "$MYSQL_OPTS"

echo "Execution of SQL files in $DIR_NAME complete."