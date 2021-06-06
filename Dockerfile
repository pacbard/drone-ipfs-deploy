FROM node:slim

RUN yarn global add ipfs-deploy

ADD build.sh /bin/
RUN chmod +x /bin/build.sh
ENTRYPOINT /bin/build.sh
