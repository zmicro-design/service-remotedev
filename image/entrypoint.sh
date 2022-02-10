#!/bin/bash

# echo "Start OpenSSH Server ..."
sudo service ssh restart

if [ -f /etc/init.d/rsyslog ]; then
  # Reference: https://stackoverflow.com/questions/22526016/docker-container-sshd-logs
  # echo "Start Rsyslog(/var/log/auth.log) ..."
  if [ -f "/run/rsyslogd.pid" ]; then
    sudo rm -rf /run/rsyslogd.pid
  fi

  sudo service rsyslog restart
fi

if [ -f /etc/init.d/fail2ban ]; then
  # Reference: https://stackoverflow.com/questions/22526016/docker-container-sshd-logs
  # echo "Start Fail2ban(/var/log/fail2ban.log) ..."
  if [ -f "/var/run/fail2ban/fail2ban.sock" ]; then
    sudo rm -rf /var/run/fail2ban/fail2ban.sock
  fi

  sudo service fail2ban restart
fi

# Change Mirror
# bash /build/scripts/change-mirrors.sh

echo ""
echo "##################################"
echo "Now, Everything is Ready ..."
echo "##################################"
echo ""

sleep infinity
