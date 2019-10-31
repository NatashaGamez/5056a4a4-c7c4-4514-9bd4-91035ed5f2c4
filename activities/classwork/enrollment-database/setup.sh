#!/usr/bin/env bash

create-database-volume () {
  database_volume_name="enrollment-data"
  if [[ "$(docker volume ls --format "{{.Name}}" | xargs)" != *"${database_volume_name}"* ]]; then
    echo "[INFO] Creating the enrollemnt data volume ${database_volume_name};"
    docker volume create "${database_volume_name}"
  fi
}

main () {
  create-database-volume
  cp .env.dev .env
}

main "${@}"
