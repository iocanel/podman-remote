FROM fedora:36

# Install Podman and Socat
RUN dnf install -y podman socat

# Copy the systemd service file
COPY podman-remote.service /etc/systemd/system/

RUN systemctl enable podman.service
RUN systemctl enable podman-remote.service

# Expose port 2375
EXPOSE 2375

# Start systemd
CMD ["/usr/sbin/init"]

