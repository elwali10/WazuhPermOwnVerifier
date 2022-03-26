#!/usr/bin/bash

my_dir=$(pwd)

echo -e "\nGetting Ownership & Permission of the current Wazuh manager... \n"
$(find /var/ossec/ -printf '%M %u %g %p\n' | tac > WazuhManagerPOFile)


differencePO=$(diff "$1" "$my_dir/WazuhManagerPOFile")

if [[ "${#differencePO}" -gt 0 ]]
then
      echo -e "The difference is : \n"
      echo -e " $differencePO\n"
else
      echo "All permissions and ownerships are matching!"
fi

$(rm -f $my_dir/WazuhManagerPOFile)
