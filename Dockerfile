FROM resin/raspberry-pi-python:latest

ENTRYPOINT []
RUN apt-get update && apt-get -y install sox swig3.0 python-pyaudio python3-pyaudio libatlas-base-dev

WORKDIR /root/  

COPY src /root/service
ADD https://s3-us-west-2.amazonaws.com/snowboy/snowboy-releases/rpi-arm-raspbian-8.0-1.2.0.tar.bz2 /root/snowboy
RUN cp /root/snowboy/_snowboydetec.so /root/service/
RUN cp /root/snowboy/snowboydecoder.py /root/service/
RUN cp /root/snowboy/snowboydetec.py /root/service/
RUN pip install -r /root/service/requirements.txt

COPY walle.pmdl /root/walle.pmdl
COPY asoundrc /root/.asoundrc

RUN find /root/
CMD [ "python", "/root/service/main.py", "/root/walle.pmdl"]
