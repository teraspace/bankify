FROM ruby:2.7.6
ENV DATABASE_HOST=db
ENV DATABASE_USERNAME=developer
ENV DATABASE_PASSWORD=password
RUN apt-get update -qq \
&& apt-get install -y nodejs postgresql-client openssh-server sudo -y
RUN echo 'root:test' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
EXPOSE 22
RUN service ssh start
ADD . /Rails-Docker
WORKDIR /Rails-Docker
RUN bundle install
EXPOSE 3000
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
