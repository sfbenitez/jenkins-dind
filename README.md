# Run requirements

* Install latest [docker-engine](https://docs.docker.com/engine/installation/) and [docker-compose](https://docs.docker.com/compose/install)

# Build docker image

## Build requirements

* overlayfs-able kernel (for merging the 3 involved docker build contexts)
* docker-engine

## Build instructions

* Install [baids](https://github.com/rcmorano/baids)
* Link project's baids:
```
# set correspondingly:
export PROJECT_DIR=$HOME/Projects/emergya/jenkins-dind
ln -s $PROJECT_DIR/baids $HOME/.baids/functions.d/jenkins-dind
```
* Build by executing the build baid:
```
jenkins-dind-build-docker-image
```

# Run/Install

```
export ENV_VHOST=jenkins.emergya.com
export DATA_DIR=$PWD/data
docker-compose up -d
docker-compose exec jenkins.emergya.com cat /var/jenkins_home/secrets/initialAdminPassword
```
