FROM ruby:2.7.6
ENV DATABASE_HOST=db
ENV DATABASE_USERNAME=postgres
ENV DATABASE_PASSWORD=password
RUN apt-get update -qq \
&& apt-get install -y nodejs postgresql-client
ADD . /Rails-Docker
WORKDIR /Rails-Docker
RUN bundle install
EXPOSE 3000
CMD ["bash"]
