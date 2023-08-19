#cloud-config
package_update: false
package_upgrade: false

password: ${password}
chpasswd: { expire: False }
ssh_pwauth: True

packages:
  - curl

runcmd:
 - [ sh, -c, 'echo "nameserver 8.8.8.8" >> /etc/resolv.conf' ]
 - sudo apt install -y prometheus-node-exporter
 - sudo apt install -y net-tools

final_message: "The system is finally up, after $UPTIME seconds"
