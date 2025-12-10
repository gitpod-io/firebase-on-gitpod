FROM gitpod/workspace-full:latest

# Disable npm lifecycle scripts for security
RUN npm config set ignore-scripts true --location=user && \
    echo 'ignore-scripts true' >> ~/.yarnrc

# Cache firebase
RUN npm install --global --ignore-scripts npm firebase firebase-tools