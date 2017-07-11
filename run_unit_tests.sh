#!/bin/bash

CMD="sudo docker-compose -f ./docker/b_greets_unit_tests_compose.yml  -p unittests up --build --force-recreate"

$CMD
RESULT=$?
if [$RESULT -ne 0]; then
    echo "failed unit tests"
    exit 1
fi
exit 0
