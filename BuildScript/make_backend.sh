#!/bin/bash
###################################################################################
# You can use the below 4 command to run this file
# docker run -d -it -e GIT_USER=<user_name> -e GIT_PASS=<password> -e GIT_BRANCH=<branch_name> -e LICENSE_REQUIRED=<True/False> --name=<container_name> <Image_Name ngdmapo/dmap_build:v1>
# docker cp <path of make_backend.sh file> <container_name>:/usr/local/tomcat
# docker exec -it <container_name> sh /usr/local/tomcat/make_backend.sh
# docker cp <container_name>:/usr/local/tomcat/DMAP_Backend/dist/Service.tar .
###################################################################################

# turn on bash's job control
#set -m

cd DMAP_Extension-Flask
 
sed -i 's/psycopg2/#psycopg2/g' requirements.txt

python3 -m pip install -r requirements.txt
#python3 -m pip install https://github.com/pyinstaller/pyinstaller/tarball/develop
python3 -m pip install pyinstaller
python3 -m pip install psycopg2-binary

pyinstaller Service.py

cp -r Resources Logs templates Utility dist/Service/
#cp -r /usr/local/lib/python3.6/site-packages/humanfrien* dist/Service/

cp -r /usr/local/lib/python3.6/site-packages/openpyxl* dist/Service/
#cp -r /usr/local/lib/python3.9/site-packages/* dist/Service/
#cp -r /var/lib/pgsql/.local/lib/python3.9/site-packages/ dist/Service/

cd dist/Service

cd ..
tar -cvf Service.tar Service
