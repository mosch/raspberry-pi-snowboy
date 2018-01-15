FROM resin/raspberry-pi-python:latest

ENTRYPOINT []
#RUN apk add --no-cache curl gcc musl-dev portaudio-dev make swig g++ openblas-dev openblas
#RUN pip install pyaudio
RUN apt-get update && apt-get -y install sox swig3.0 python-pyaudio python3-pyaudio libatlas-base-dev

WORKDIR /root/  

#RUN curl -L --output snowboy.tar.gz https://github.com/Kitt-AI/snowboy/archive/v1.2.0.tar.gz
RUN curl -L --output snowboy.tar.gz https://s3-us-west-2.amazonaws.com/snowboy/snowboy-releases/rpi-arm-raspbian-8.0-1.2.0.tar.bz2
RUN tar -xvf snowboy.tar.gz 
RUN pip install pyaudio

#RUN cd snowboy-1.2.0
ADD walle.pmdl /root/walle.pmdl

#RUN cd /root/snowboy-1.2.0/swig/Python && make
RUN find /root/
CMD [ "python", "/root/rpi-arm-raspbian-8.0-1.2.0/demo.py", "/root/walle.pmdl"]
#CMD [ "python", "/root/snowboy-1.2.0/examples/Python/demo.py", "/root/walle.pmdl"]
