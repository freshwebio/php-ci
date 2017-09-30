FROM circleci/php-7.1.9
# Add the Cloud SDK distribution URI as a package source
RUN sudo apt-get update
COPY . /ci-scripts
RUN chmod +x /ci-scripts/install-composer.sh
RUN /ci-scripts/install-composer.sh
RUN export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
# Import the Google Cloud Platform public key
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
# Update the package list and install the Cloud SDK
RUN sudo apt-get update && \
   sudo apt-get install -y google-cloud-sdk kubectl
