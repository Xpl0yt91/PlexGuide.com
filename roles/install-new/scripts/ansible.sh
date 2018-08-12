#!/bin/bash
#
# GitHub:   https://github.com/Admin9705/PlexGuide.com-The-Awesome-Plex-Server
# Author:   Admin9705 & Deiteq & FlickerRate
# URL:      https://plexguide.com
#
# PlexGuide Copyright (C) 2018 PlexGuide.com
# Licensed under GNU General Public License v3.0 GPL-3 (in short)
#
#   You may copy, distribute and modify the software as long as you track
#   changes/dates in source files. Any modifications to our software
#   including (via compiler) GPL-licensed code must also be made available
#   under the GPL along with build & install instructions.
#
#################################################################################

######################################################## Declare Variables
sname="Ansible - New Install"

######################################################## START: PG Log
sudo echo "INFO - Start of Script: $sname" > /var/plexguide/pg.log
sudo bash /opt/plexguide/roles/log/log.sh
######################################################## START: Main Script
file="/var/plexguide/pg.ansible.stored"
  if [ -e "$file" ]
    then
      echo "" 1>/dev/null 2>&1
    else
      clear
      read -n 1 -s -r -p "Installing ANSIBLE: Press [ANY] Key to Continue"
      sudo apt-get remove ansible
      sudo apt-add-repository --remove ppa:ansible/ansible -y && sudo add-apt-repository ppa:ansible/ansible-2.5 -y && sudo apt install ansible -y
      apt-get update -y
      apt-get install ansible 2.5.5 -y
      apt-mark hold ansible
      yes | apt-get update
      cat /var/plexguide/pg.ansible > /var/plexguide/pg.ansible.stored
  fi
######################################################## END: Main Script
#
#
######################################################## END: PG Log
sudo echo "INFO - END of Script: $sname" > /var/plexguide/pg.log
sudo bash /opt/plexguide/roles/log/log.sh
