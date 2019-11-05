#!/usr/bin/env bash

create-volume () {
  local volume_name="${1}"
  if [[ "$(docker volume ls --format "{{.Name}}" | xargs)" != *"${volume_name}"* ]]; then
    echo "[INFO] Creating the volume: ${volume_name};"
    docker volume create "${volume_name}"
  fi
}

create-database-volume () {
  database_volume_name="wine-database-vol"
  create-volume "${database_volume_name}"
}

create-application-volume () {
  application_volume_name="wine-application-vol"
  create-volume "${application_volume_name}"
}

main () {
  create-database-volume
  create-application-volume
  cp .env.local .env
}

main "${@}"
