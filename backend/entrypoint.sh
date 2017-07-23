#!/bin/bash

set -e
run_cmd="dotnet run"

until dotnet restore && dotnet build; do
>&2 echo "No project to restore/build..."
sleep 1
done

until dotnet ef database update; do
>&2 echo "Database is starting up..."
sleep 1
done

>&2 echo "Ready - starting kestrel"
exec $run_cmd