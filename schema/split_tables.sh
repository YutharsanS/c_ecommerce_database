#!/bin/bash

# Create a directory for the output files
mkdir -p tables

# Initialize an array to store table names
declare -a table_names

# First pass: collect all table names
while IFS= read -r line
do
    if [[ $line == "DROP TABLE IF EXISTS"* ]]; then
        table_name=$(echo "$line" | awk '{print $5}' | tr -d ';\r')
        table_names+=("$table_name")
    fi
done < input.sql

# Function to write foreign key check commands and table definition
write_table_file() {
    local file=$1
    local drop_statement=$2
    local create_statement=$3

    echo "-- Disable foreign key checks" > "$file"
    echo "SET FOREIGN_KEY_CHECKS = 0;" >> "$file"
    echo "" >> "$file"

    echo "$drop_statement" >> "$file"
    echo "" >> "$file"
    echo "$create_statement" >> "$file"

    echo "" >> "$file"
    echo "-- Re-enable foreign key checks" >> "$file"
    echo "SET FOREIGN_KEY_CHECKS = 1;" >> "$file"
}

# Second pass: create individual files with DROP and CREATE statements
table_name=""
create_statement=""
for table in "${table_names[@]}"
do
    drop_statement=$(grep "DROP TABLE IF EXISTS $table;" input.sql)
    create_statement=""
    capturing=false

    while IFS= read -r line
    do
        if [[ $line == "CREATE TABLE $table"* ]]; then
            capturing=true
            create_statement+="$line"$'\n'
        elif [[ $capturing == true ]]; then
            create_statement+="$line"$'\n'
            if [[ $line == ");"* ]]; then
                capturing=false
                write_table_file "tables/${table}.sql" "$drop_statement" "$create_statement"
                break
            fi
        fi
    done < input.sql
done

echo "Table definitions, including DROP statements and foreign key checks, have been separated into individual files in the 'tables' directory."