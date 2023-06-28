FROM ubuntu
COPY ./setup ~/setup-git-server
RUN ~/setup-git-server --pwd git
RUN rm ~/setup-git-server

