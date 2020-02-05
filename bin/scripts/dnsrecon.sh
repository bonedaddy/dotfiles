#! /bin/bash

case "$1" in
	dns-brute)
		echo "enter domain to bruteforce"
		read -n DOMAIN
		# by default use google servers
		dnsrecon -n 8.8.8.8 -d "$DOMAIN"
		;;
	google-search-brute)
		echo "enter domain to gogole search brute"
		read -n DOMAIN
		# by default use google servers
		dnsrecon -n 8.8.8.8 -d "$DOMAIN" -t goo
		;;
	install)
		sudo apt install dnsrecon -y
		;;
	*)
		echo "invalid invocation"
		echo "valid commands: dns-brute, google-search-brute, install"
		;;
esac
