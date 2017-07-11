# b_greets

deploy greetings micro service
==============================

application
-----------
written in python using the tornado module, runs on port 8888
only a GET handler is available and a very bare unit test script

docker details
--------------
all docker related files are under the docker subdirectory.

the Dockerfile is used to build the application image; the Dockerfile.test is
used to build the application test image. Both images are based on the python
2.7 docker official image.

i am using docker-compose to build/update the images. b_greets_compose.yaml is
for the application itself and b_greets_unit_tests_compose.yml is for the
test image.

a docker swarm must be intialized.

the service is launched usingg docker stack with the b_greets_services.yml.

the port mapping is 8901:8888

shell scripts
-------------
to deploy a new version of the application one should run
./test_deploy.sh. it pulls the latest master application sources from github,
rebuilds the images. it will run the unit tests; on success, it will rebuild
the application image, and then remove and re-deploy the stack.

the other shell script will only run the unit tests on the latest master.

missing pieces
--------------
the application is incomplete; it needs the POST handler and unit tests.
versions and branches are currently hard coded.
there is no integration with a true CI server.

ideally, all the docker artifacts will be migrated to use the docker python
sdk and made configurable via command line switches. also, a git server and
a true CI server need to be added.
