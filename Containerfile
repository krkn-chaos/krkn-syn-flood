FROM fedora:40

env TARGET $TARGET
env DURATION $DURATION
env TARGET_PORT $TARGET_PORT
env PACKET_SIZE $PACKET_SIZE
env WINDOW_SIZE $WINDOW_SIZE
USER root
RUN dnf update -y && dnf install --setopt=install_weak_deps=False -y hping3 && dnf clean all
WORKDIR /syn-flood
COPY run.sh run.sh
RUN chmod +x ./run.sh
#ENTRYPOINT ["/bin/bash", "run.sh", $TARGET, $DURATION, $TARGET_PORT, $PACKET_SIZE, $WINDOW_SIZE]
ENTRYPOINT ["/bin/bash", "run.sh"]