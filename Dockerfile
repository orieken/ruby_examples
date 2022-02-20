FROM ruby

ADD . /workspace
WORKDIR /workspace

RUN gem install bundler
RUN bundle install 

ENTRYPOINT [ "/bin/bash" ]
