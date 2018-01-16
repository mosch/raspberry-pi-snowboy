FROM resin/raspberry-pi-python:latest

ENTRYPOINT []

RUN [ "cross-build-start" ]

RUN apt-get update && apt-get -y install sox swig3.0 python-pyaudio python3-pyaudio libatlas-base-dev

WORKDIR /root/  

COPY src /root/service
RUN curl https://s3-us-west-2.amazonaws.com/snowboy/snowboy-releases/rpi-arm-raspbian-8.0-1.2.0.tar.bz2 \
  | tar -xjC /root/
RUN cp /root/rpi-arm-raspbian-8.0-1.2.0/_snowboydetect.so /root/service/
RUN cp /root/rpi-arm-raspbian-8.0-1.2.0/snowboydecoder.py /root/service/
RUN cp /root/rpi-arm-raspbian-8.0-1.2.0/snowboydetect.py /root/service/
RUN pip install -r /root/service/requirements.txt
COPY walle.pmdl /root/walle.pmdl
COPY asoundrc /root/.asoundrc

RUN [ "cross-build-end" ]

CMD [ "python", "/root/service/main.py", "/root/walle.pmdl"]
