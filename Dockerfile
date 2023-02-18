FROM node:slim

RUN yarn global add ipfs-deploy@12.0.1

ADD build.sh /bin/
RUN chmod +x /bin/build.sh
ENTRYPOINT /bin/build.sh
