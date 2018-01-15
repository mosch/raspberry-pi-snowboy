FROM arm32v6/node:alpine

ENTRYPOINT []
RUN apk add --no-cache nanomsg
RUN npm install nanomsg --use_system_libnanomsg=true

WORKDIR /root/  

CMD [ "ls" ]
