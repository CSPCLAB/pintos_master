# Dockerfile
FROM thierrysans/pintos

# Set working directory
WORKDIR /pintos

# Ensure the interactive session doesn't time out
RUN echo 'export TMOUT=0' >> ~/.bashrc
