#!/bin/bash

set -e
run_cmd="dotnet run"

until dotnet ef database update; do
>&2 echo "Database is starting up"
sleep 1
done

>&2 echo "Database is up - starting kestrel"
exec $run_cmd