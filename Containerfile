FROM fedora:40
LABEL dev.krkn-chaos.name="This is Service Hijacking scenario"
LABEL dev.krkn-chaos.description="Lorem Ipsum is simply dummy text of the printing and typesetting industry. \
Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, \
when an unknown printer took a galley of type and scrambled it to make a type specimen book. \
It has survived not only five centuries, but also the leap into electronic typesetting, \
remaining essentially unchanged. It was popularised in the 1960s with the \
release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop \
publishing software like Aldus PageMaker including versions of Lorem Ipsum."
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