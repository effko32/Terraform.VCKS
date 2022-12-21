[nodes]
%{ for index, ip in nodes_ip ~}
${nodes_names[index]} ansible_host=${ip}
%{ endfor ~}

[settings:children]
nodes

[linux:children]
nodes

[linux:vars]
ansible_ssh_pass=password
ansible_user=ubuntu 
ansible_become_pass=password
ansible_python_interpreter=/usr/bin/python3