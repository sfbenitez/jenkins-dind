* [hub.docker.com (automated build):](https://hub.docker.com/r/emergya/automated-jenkins-dind) [![Build Status](https://travis-ci.org/Emergya/jenkins-dind.svg?branch=master)](https://travis-ci.org/Emergya/jenkins-dind)
* [travis-ci.org (timestamped-commit tag):](https://hub.docker.com/r/emergya/jenkins-dind/) [![Build Status](https://travis-ci.org/Emergya/jenkins-dind.svg?branch=master)](https://travis-ci.org/Emergya/jenkins-dind)

# ToC (Table Of Contents)

# Run requirements

* Install latest [docker-engine](https://docs.docker.com/engine/installation/) and [docker-compose](https://docs.docker.com/compose/install)

Note: docker-compose version must be >= 1.13.0

# Build docker image

## Build requirements

* overlayfs-able kernel (for merging the 3 involved docker build contexts)
* quilt (for appyling patches to the merged docker build context)
* docker-engine


## Build instructions

* Install [baids](https://github.com/rcmorano/baids)
* Link project's baids:
```
# set correspondingly:
export PROJECT_DIR=$HOME/Projects/emergya/jenkins-dind
ln -nfs $PROJECT_DIR/baids $HOME/.baids/functions.d/jenkins-dind
baids-reload
```
* Build by executing the build baid:
```
jenkins-dind-docker-build
```

# Run/Install

```
export ENV_VHOST=jenkins.emergya.com
export DATA_DIR=$PWD/data
docker-compose up -d
```

* Get jenkins initialAdminPassword:
```
docker exec jenkins.emergya.com cat /var/jenkins_home/secrets/initialAdminPassword
```

* Get the docker container IP
```
docker inspect jenkinsdind_jenkins.emergya.com_1 | grep IPAddress | cut -d '"' -f 4
```

* Access the jenkins web interface at http://<IP>:8080
