#!/bin/bash
echo ""
cat /etc/os-release | sed -n '4p'
printf "Users:\n$(awk -F: '$3 > 999 { print $1,$7 }' /etc/passwd)\n"
printf "Open ports:\n$(sudo netstat -tulnp | sed '1,2d' | awk '{ print $4}' | awk -F: '{print $NF}' | sort -n | uniq | tr "\n" ' ')\n"
