import os
from jinja2 import Template

dsl_template = Template(file('/root/dsl-provider.ja2','r').read())
pap_template = Template(file('/root/pap-secrets.ja2','r').read())
dsl_fd = file('/etc/ppp/peers/dsl-provider','w+')
pap_fd = file('/etc/ppp/pap-secrets','w+')
dsl_fd.write(dsl_template.render(username=os.getenv('pppoeuser','test')))
pap_fd.write(pap_template.render(username=os.getenv('pppoeuser','test'),password=os.getenv('pppoepw','pass')))

