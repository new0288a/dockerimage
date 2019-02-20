From ubuntu
RUN yes | apt update
RUN yes | apt install vim net-tools pppoeconf pppoe iputils-ping kmod
ADD dsl-provider /etc/ppp/peers/dsl-provider
ADD pap-secrets /etc/ppp/pap-secrets

