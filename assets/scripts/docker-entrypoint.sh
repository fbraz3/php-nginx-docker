#!/bin/bash

# SET CUSTOM ID FOR www-data USER
if  [[ ! -z "$DATA_UID" ]] && [[ $DATA_UID =~ ^[0-9]+$ ]] ; then
	$(which usermod) -u $DATA_UID www-data;
fi

# SET CUSTOM ID FOR www-data GROUP
if  [[ ! -z "$DATA_GUID" ]] && [[ $DATA_GUID =~ ^[0-9]+$ ]] ; then
	$(which groupmod) -g $DATA_GUID www-data;
fi

$(which sed) -i 's/%PHP_VERSION%/'$PHPVERSION'/g' /etc/nginx/sites-available/default

# START SERVICES
/etc/init.d/nginx restart
sleep 1
/etc/init.d/monit restart
