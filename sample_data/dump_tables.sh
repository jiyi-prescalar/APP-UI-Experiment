#!/bin/bash

# List of tables to dump
tables=(
    #"event_data"
    #"process_metadata"
    "devices"
    "firmware_releases"
    "device_types"
)

# Ensure .pgpass file exists with correct permissions
PGPASSFILE="$HOME/.pgpass"
if [ ! -f "$PGPASSFILE" ]; then
    echo "localhost:5432:hardware:prescalar:scalar" > "$PGPASSFILE"
    chmod 600 "$PGPASSFILE"
fi

# Export PGPASSFILE environment variable
export PGPASSFILE

if [ "$1" = "all_sql" ]; then
    # All table dump
    pg_dump -h localhost -U prescalar -d hardware --format=plain -f all_tables.sql
else
    # Individual table dump
    for table in "${tables[@]}"; do
        psql -h localhost -U prescalar -d hardware -c "SELECT json_agg(t) FROM ${table} t;" > "${table}.json"
    done
fi
