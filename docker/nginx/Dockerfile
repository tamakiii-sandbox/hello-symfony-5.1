FROM nginx:1.19.2

COPY ./default.conf /etc/nginx/conf.d/default.conf

RUN apt update && \
    apt install -y --no-install-recommends \
      make \
      && \
    apt clean -y && \
    apt autoremove -y && \
    rm -r /var/lib/apt/lists/*
