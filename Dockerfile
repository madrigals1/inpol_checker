# https://github.com/atlassian/docker-chromium-xvfb/blob/master/images/base/xvfb-chromium
FROM debian:stable
ENV DEBIAN_FRONTEND=noninteractive
ARG VNC_PASSWORD="password"

RUN \
  apt update \
  && apt install -y \
    awesome \
    chromium \
    chromium-driver \
    curl \
    htop \
    iproute2 \
    nano \
    procps \
    python3 \
    python3-pip \
    wget \
    x11vnc \
    xvfb \
  && mkdir -p /root/.vnc \
  && x11vnc -storepasswd $VNC_PASSWORD /root/.vnc/passwd

RUN pip install pipenv

WORKDIR /opt/src
COPY Pipfile* /opt/src/
RUN pipenv install --deploy --system
COPY . /opt/src/

ADD docker-entrypoint /usr/bin/docker-entrypoint
ENTRYPOINT ["/usr/bin/docker-entrypoint"]
CMD ["python3", "run_staged_multi_loop_wh.py"]
