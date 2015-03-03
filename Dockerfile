# Base on ubuntu 14:04 and python 
FROM dockerfile/python
RUN apt-get update
RUN apt-get -y install redis-server 

# Add and install Python modules
RUN mkdir -p /src
RUN pip install flask==0.9
RUN pip install redis==2.10.3
ADD app.py /src/app.py

# Bundle app source
EXPOSE 5000
CMD ["python", "/src/app.py"]
