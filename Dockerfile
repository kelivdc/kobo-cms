# Use the official Ruby image as the base image
FROM ruby:3.0.2

# Set the working directory inside the container
WORKDIR /app

# Install system dependencies
RUN apt-get update && \
    apt-get install -y nodejs yarn

# Install Rails gem
RUN gem install rails -v '7.0.6'

# Copy the Gemfile and Gemfile.lock into the image and install gems
COPY Gemfile Gemfile.lock ./
RUN gem install bundler
RUN bundle install

# Copy the rest of the application code
COPY . .

# Expose port 3000 to the host, which is the default Rails port
EXPOSE 3000

# Start the Rails server without the database
CMD ["rails", "server", "-b", "0.0.0.0", "--skip-puma", "--skip-spring", "--skip-keeps", "--skip-listen"]
