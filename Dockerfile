FROM circleci/php:7.1.9-apache-browsers
RUN sudo apt-get install -y libpng-dev
RUN sudo docker-php-ext-install pdo pdo_mysql gd
# Install php gd (Drupal 8.5+ requires this) and some other packages.
RUN sudo apt-get update
RUN sudo apt-get install lsb-core