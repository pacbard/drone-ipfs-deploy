FROM node:slim

RUN yarn global add ipfs-deploy@11.2.2

ADD build.sh /bin/
RUN chmod +x /bin/build.sh
ENTRYPOINT /bin/build.sh
