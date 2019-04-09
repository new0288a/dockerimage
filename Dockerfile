From ubuntu
RUN yes | apt update
RUN yes | apt install vim net-tools pppoeconf pppoe iputils-ping kmod python python-pip
RUN yes | pip install jinja2
ADD dsl-provider.ja2 /root/dsl-provider.ja2
ADD pap-secrets.ja2 /root/pap-secrets.ja2
ADD modify_pppoe_conf_file.py /root/modify_pppoe_conf_file.py
ADD first_run.sh /root/first_run.sh
ENTRYPOINT ["/bin/bash", "/root/first_run.sh"]
