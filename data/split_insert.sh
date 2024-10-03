#!/bin/bash

# Create a directory for the output files
mkdir -p data

# Function to write foreign key check commands and INSERT statements
write_data_file() {
    local file=$1
    local table_name=$2
    local statements=$3

    echo "-- Disable foreign key checks" > "$file"
    echo "SET FOREIGN_KEY_CHECKS = 0;" >> "$file"
    echo "" >> "$file"

    echo "-- Populate $table_name table" >> "$file"
    echo "$statements" >> "$file"

    echo "" >> "$file"
    echo "-- Re-enable foreign key checks" >> "$file"
    echo "SET FOREIGN_KEY_CHECKS = 1;" >> "$file"
}

# Initialize variables
current_table=""
insert_statements=""

# Read the input file line by line
while IFS= read -r line
do
    # Check if the line starts a new table's INSERT statements
    if [[ $line == "-- Populate"* ]] || [[ $line == "-- Update inventory"* ]]; then
        # If we have accumulated INSERT statements, write them to a file
        if [[ -n $current_table && -n $insert_statements ]]; then
            write_data_file "data/Population_${current_table}.sql" "$current_table" "$insert_statements"
        fi

        # Extract the new table name
        current_table=$(echo "$line" | awk '{print $3}')
        insert_statements=""
    elif [[ $line == "INSERT INTO"* ]] || [[ $line == "UPDATE"* ]]; then
        # Accumulate INSERT or UPDATE statements
        insert_statements+="$line"$'\n'
    elif [[ -n $insert_statements ]]; then
        # Continue accumulating multi-line INSERT statements
        insert_statements+="$line"$'\n'
    fi
done < input.sql

# Write the last table's INSERT statements
if [[ -n $current_table && -n $insert_statements ]]; then
    write_data_file "data/Population_${current_table}.sql" "$current_table" "$insert_statements"
fi

echo "INSERT statements have been separated into individual files with 'Population_' prefix in the 'data' directory."