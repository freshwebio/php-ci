FROM circleci/php:7.1.9
RUN sudo docker-php-ext-install pdo pdo_mysql
# Install php gd (Drupal 8.5+ requires this) and some other packages.
RUN sudo apt-get update
RUN sudo apt-get install lsb-core
RUN sudo apt-get install php7.1-gd