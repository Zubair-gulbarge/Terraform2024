#!/bin/bash
sudo apt-get update
sudo apt-get install nginx -y
sudo service nginx start
sudo echo "<h1> Hello Luffy </h1>" > /var/www/html/index.html