#this is file for catalogue server
cp catalogue.service /etc/systemd/system/catalogue.service
cp mongo.repo /etc/yum.repos.d/mongo.repo

dnf module disable nodejs -y
dnf module enable nodejs:20 -y

dnf install nodejs -y

useradd roboshop

mkdir /app

curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip

cd /app
unzip /tmp/catalogue.zip

#cd /app
npm install

#cp catalogue.service /etc/systemd/system/catalogue.service

#systemctl daemon-reload

#systemctl enable catalogue
#systemctl restart catalogue

#cp mongo.repo /etc/yum.repos.d/mongo.repo

dnf install mongodb-mongosh -y

mongosh --host MONGODB-SERVER-IPADDRESS </app/db/master-data.js

systemctl daemon-reload

systemctl enable catalogue
systemctl restart catalogue