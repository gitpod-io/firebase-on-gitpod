FROM gitpod/workspace-full:latest

# Disable npm lifecycle scripts and npx for security
RUN npm config set ignore-scripts true --location=user && \
    echo 'ignore-scripts true' >> ~/.yarnrc && \
    rm -f /usr/bin/npx /usr/local/bin/npx && \
    echo '#!/bin/sh' > /usr/local/bin/npx && \
    echo 'echo "npx is disabled for security reasons. Use explicit package installation instead." >&2' >> /usr/local/bin/npx && \
    echo 'exit 1' >> /usr/local/bin/npx && \
    chmod +x /usr/local/bin/npx

# Cache firebase
RUN npm install --global --ignore-scripts npm firebase firebase-tools