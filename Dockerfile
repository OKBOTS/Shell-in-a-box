# Use a base image that supports systemd, for example, Ubuntu
FROM ubuntu:20.04


ARG ROOT_PASSWORD
ENV ROOT_PASSWORD $ROOT_PASSWORD

# Set root password
# Install necessary packages
RUN apt-get update && \
    apt-get install -y shellinabox && \
    apt-get install -y systemd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN echo 'root:$ROOT_PASSWORD' | chpasswd
# Only change the second root
# Expose the web-based terminal port
EXPOSE 4200

# Start shellinabox
CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
