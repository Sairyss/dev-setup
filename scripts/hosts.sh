# https://github.com/StevenBlack/hosts
# unified hosts to block malicious websites
curl -o hosts https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling/hosts &&
  mv /etc/hosts /etc/hosts_backup &&
  mv hosts /etc/hosts
