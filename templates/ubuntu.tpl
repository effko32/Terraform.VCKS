#cloud-config
package_upgrade: false

password: ${password}
chpasswd: { expire: False }
ssh_pwauth: True

runcmd:
 - [ sh, -c, 'echo "nameserver 8.8.8.8" >> /etc/resolv.conf' ]
 - sudo apt install -y prometheus-node-exporter
 - sudo apt install -y net-tools