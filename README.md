# Run/Install

```
export ENV_VHOST=jenkins.emergya.com
export DATA_DIR=$PWD/data
docker-compose up -d
docker-compose exec jenkins.emergya.com cat /var/jenkins_home/secrets/initialAdminPassword
```
