#!/usr/bin/bash

my_dir=$(pwd)

echo -e "\nGetting Ownership & Permission of the current Wazuh manager... \n"
$(find /var/ossec/  ! -path "/var/ossec/var/run/*" ! -path "/var/ossec/logs/alerts/*/*" ! -path "/var/ossec/logs/archives/*/*" -printf '%M %u %g %p\n'| tac > WazuhManagerPOFile)


differencePO=$(diff "$1" "$my_dir/WazuhManagerPOFile")

if [[ "${#differencePO}" -gt 0 ]]
then
      echo -e "The difference is : \n"
      echo -e " $differencePO\n"
else
      echo -e "All the verified permissions and ownership are matching! \n"
      echo -e "The directories and files under /var/ossec/logs/alerts/, /var/ossec/logs/archives/,  and /var/ossec/var/run/ must be verified manualy.\n "
fi

$(rm -f $my_dir/WazuhManagerPOFile)
