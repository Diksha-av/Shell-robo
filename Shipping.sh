#this is file for shipping server

cp shipping.service /etc/systemd/system/shipping.service

dnf install maven -y

useradd roboshop

mkdir /app

curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping-v3.zip

cd /app
unzip /tmp/shipping.zip

#cd /app
mvn clean package

mv target/shipping-1.0.jar shipping.jar

#cp shipping.service /etc/systemd/system/shipping.service

#systemctl daemon-reload

#systemctl enable shipping
#systemctl start shipping

dnf install mysql -y

mysql -h <MYSQL-SERVER-IPADDRESS> -uroot -pRoboShop@1 < /app/db/app-user.sql

mysql -h <MYSQL-SERVER-IPADDRESS> -uroot -pRoboShop@1 < /app/db/master-data.sql

systemctl daemon-reload

systemctl enable shipping
systemctl restart shipping