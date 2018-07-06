mysql:  

docker pull mysql:5.6
docker run --name shoponline-mysql -e MYSQL_ROOT_PASSWORD=123456 -d -p 3307:3306 mysql:5.6


tomcat 

docker build -t shoponline .
docker run --name shoponline-tomcat --link shoponline-mysql:mysql -d -p 8888:8080 shoponline