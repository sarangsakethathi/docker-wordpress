# Use an official Ubuntu as the base image
FROM ubuntu:latest

# Update the package repository and install essential packages
RUN apt-get update \
    && apt-get install -y software-properties-common \
    && add-apt-repository ppa:ondrej/php \
    && apt-get update \
    && apt-get install -y php7.2 php7.2-cli php7.2-common php7.2-json php7.2-opcache php7.2-mysql php7.2-mbstring php7.2-zip php7.2-fpm php7.2-curl php7.2-gd php7.2-xml php7.2-bcmath wget

#Create doc root for wordpress
#
RUN mkdir /opt/server/
# Download and extract WordPress
RUN wget https://wordpress.org/latest.tar.gz -O /tmp/wordpress.tar.gz \
    && tar -xzvf /tmp/wordpress.tar.gz -C /opt/server/ \
    && rm /tmp/wordpress.tar.gz

# Set the correct permissions for WordPress
RUN chown -R www-data:www-data /opt/server/wordpress

# Your further instructions and commands go here

