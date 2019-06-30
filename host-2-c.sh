export DEBIAN_FRONTEND=noninteractive

apt-get update && apt-get install -y apt-transport-https ca-certificates curl software-properties-common --assume-yes --force-yes
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
apt-key fingerprint 0EBFCD88 | grep docker@docker.com || exit 1
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
#add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu artful stable"
apt-get update
#apt-get install -y docker-ce --assume-yes --force-yes
#Errors after the last updates. Different version needed
apt-get install docker-ce=18.06.1~ce~3-0~ubuntu --assume-yes --force-yes

# # Setting docker ports AND Check for an html page. If there is not, it is automatically downloaded
# https://hub.docker.com/_/nginx/
docker run --name docker-nginx -p 8080:80 -d -v ~/docker-nginx/html:/usr/share/nginx/html nginx



# Setting up eth1 interface (North)
ip link set dev eth1 up

# What's my address?
ip addr add 172.23.1.34/30 dev eth1

# Where should I go?
ip route del default
ip route add default via 172.23.1.33
