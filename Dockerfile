# Base on ubuntu 14:04 and python 
FROM dockerfile/python
# Must add this repo for Redis 2.8.9, otherwise we get 2.8.4 which doesn't have HyperLogLog
RUN sudo apt-add-repository ppa:chris-lea/redis-server
RUN apt-get update
RUN apt-get -y install redis-server 

RUN pip install flask==0.9
RUN pip install redis==2.10.3

RUN mkdir -p /src
ADD . /src/

# Bundle app source
EXPOSE 5000
CMD ["/src/start.sh"]
