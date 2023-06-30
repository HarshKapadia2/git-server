FROM ubuntu
RUN apt-get update && apt-get install -y bash git
RUN git clone https://github.com/HarshKapadia2/git-server.git ~/git-server
RUN printf "#! /bin/bash\n\n\$@\n" > /usr/bin/sudo && chmod +x /usr/bin/sudo
RUN bash ~/git-server/setup --pwd git --default-branch main
RUN rm /usr/bin/sudo
