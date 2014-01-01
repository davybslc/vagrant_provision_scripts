## install_before script ##


## Repository

	if [[ ! -f /etc/apt/sources.list.original ]] && \
		[[ -n $ubuntu_mirror ]];
	then
		cp /etc/apt/sources.list /etc/apt/sources.list.original
		sed \
			"s/us.archive.ubuntu.com/$ubuntu_mirror/" \
			< /etc/apt/sources.list.original \
			> /etc/apt/sources.list
	else
		echo "Repository already configured to $ubuntu_mirror"
	fi


## Time Zone

	if [[ -n $time_zone ]];
	then
		echo $time_zone > /etc/timezone
		dpkg-reconfigure --frontend noninteractive tzdata
	fi


## Update and Upgrade 

	# Get update-success-stamp file last modified
	last_update_raw=$(stat -c %y /var/lib/apt/periodic/update-success-stamp)

	# Extract the date
	last_update_cooked=${last_update_raw:0:10}

	# Get today's date
	today=$(date --rfc-3339=date)

	# if last update was not today
	if [[ $last_update_cooked != $today ]];
	then
		# run update
		apt-get -y update

		# run upgrade
		DEBIAN_FRONTEND=noninteractive \
			apt-get -y \
			-o Dpkg::Options::="--force-confdef" \
			-o Dpkg::Options::="--force-confold" \
			upgrade
	else
		echo "apt-get update and apt-get upgrade have already been run today ($last_update_cooked)"
	fi
