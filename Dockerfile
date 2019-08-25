FROM ruby:2.6.3

# Install system dependencies
RUN apt-get update && apt-get install -y build-essential

# Install Node.js v12
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs

# Install yarn
RUN npm install -g yarn

RUN mkdir -p /opt/venja
WORKDIR /opt/venja

COPY Gemfile* ./
RUN bundle install

COPY package.json yarn.lock ./
RUN yarn install

COPY . .
RUN rm config/database.yml

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
