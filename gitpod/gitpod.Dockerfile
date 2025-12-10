FROM gitpod/workspace-full:latest

# Disable npm lifecycle scripts and npx for security
RUN npm config set ignore-scripts true --location=user && \
    echo 'ignore-scripts true' >> ~/.yarnrc && \
    NPX_PATH=$(which npx) && \
    rm -f "$NPX_PATH" && \
    echo '#!/bin/sh' > "$NPX_PATH" && \
    echo 'echo "npx is disabled for security reasons. Use explicit package installation instead." >&2' >> "$NPX_PATH" && \
    echo 'exit 1' >> "$NPX_PATH" && \
    chmod +x "$NPX_PATH"

# Cache firebase
RUN npm install --global --ignore-scripts npm firebase firebase-tools