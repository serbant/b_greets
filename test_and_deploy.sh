#!/bin/bash

TEST_CMD="sudo docker-compose -f ./docker/b_greets_unit_tests_compose.yml  -p unittests up --build --force-recreate"

BUILD_CMD="sudo docker-compose -f ./docker/b_greets_compose.yml up -d --build --force-recreate"

REMOVE_STACK_CMD=="sudo docker stack rm b_greets"

DEPLOY_STACK_CMD="sudo docker stack deploy -c docker/b_greets_services.yml b_greets"

SHOW_CMD="sudo docker ps"

echo "testing............."
$TEST_CMD
RESULT=$?
if [$RESULT -ne 0]; then
    echo "unit test are failing, will not deploy"
    exit 1
fi

echo "rebuilding app image with the latest code.........."
$BUILD_CMD
RESULT=$?
if [$RESULT -ne 0]; then
    echo "cannot build the update image"
    exit 1
fi

echo "remove the services using the obsolete image....."
$REMOVE_STACK_CMD
RESULT=$?
if [$RESULT -ne 0]; then
    echo "cannot remove the obsolete services"
    exit 1
fi

echo "deploying the services using the updated image....."
$DEPLOY_STACK_CMD
RESULT=$?
if [$RESULT -ne 0]; then
    echo "cannot start the services"
    exit 1
fi

sleep 5
echo "running......................"
$SHOW_CMD
exit 0


