# install Docker
sudo apt install docker

#install docker compose
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.24.2/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose

chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose

docker compose version

#Clone defectdojo code from github
git clone https://github.com/DefectDojo/django-DefectDojo
cd django-DefectDojo

#Run the shell build files
./dc-build.sh

#Run the shell container shell file
./dc-up-d.sh 

#Expose ports to access it on port 8080 on the browser
#Get password
docker-compose logs initializer | grep "Admin password:"
