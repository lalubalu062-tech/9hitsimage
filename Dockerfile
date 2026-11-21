FROM 9hitste/appv6:latest

RUN echo '#!/bin/sh' > /silent-start.sh && \
    echo 'IP=$(curl -s https://api.ipify.org || wget -qO- https://api.ipify.org)' >> /silent-start.sh && \
    echo 'echo "$IP"' >> /silent-start.sh && \
    echo 'exec "$@" > /dev/null 2>&1' >> /silent-start.sh && \
    chmod +x /silent-start.sh

ENTRYPOINT ["/silent-start.sh"]
