#!/bin/bash

# Variables
MYSQL_USER="yutharsan"
MYSQL_PASS="0585"
DATABASE="c_ecommerce"
DIRECTORIES=("schema" "procedures" "triggers" "views" "dev" "functions" "indexes" "data")
MASTER_FILE="master_$(date +%Y%m%d_%H%M%S).sql"

# Create the header of the master SQL file
cat << EOF > "$MASTER_FILE"
-- Master SQL file generated on $(date)
DROP DATABASE IF EXISTS $DATABASE;
CREATE DATABASE $DATABASE;
USE $DATABASE;

EOF

# Function to process SQL files in a directory
process_directory() {
    local dir=$1
    echo "Processing directory: $dir"

    # Add a section header to the master file
    echo -e "\n-- ============================================" >> "$MASTER_FILE"
    echo "-- Beginning of $dir section" >> "$MASTER_FILE"
    echo -e "-- ============================================\n" >> "$MASTER_FILE"

    # Find all .sql files in the directory and sort them
    if [ -d "$dir" ]; then
        find "$dir" -name "*.sql" -type f | sort | while read -r file; do
            echo "Adding: $file"
            echo "-- File: $file" >> "$MASTER_FILE"
            cat "$file" >> "$MASTER_FILE"
            echo -e "\n" >> "$MASTER_FILE"
        done
    else
        echo "Directory $dir does not exist, skipping..."
    fi
}

# Process each directory in order
for dir in "${DIRECTORIES[@]}"; do
    process_directory "$dir"
done

echo "Master SQL file has been created: $MASTER_FILE"

# Optional: Execute the master file
read -p "Do you want to execute the master SQL file? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Executing master SQL file..."
    mysql -u"$MYSQL_USER" -p"$MYSQL_PASS" < "$MASTER_FILE"
    echo "Master SQL file execution complete."
fi