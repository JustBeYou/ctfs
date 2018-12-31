FROM ubuntu:18.04
RUN apt update 
RUN apt-get -y install ltrace python3.6
ADD dist/Collection.cpython-36m-x86_64-linux-gnu.so /usr/local/lib/python3.6/dist-packages/Collection.cpython-36m-x86_64-linux-gnu.so

ADD dist/test.py test.py
ADD dist/server.py server.py
CMD ltrace python3.6 test.py
