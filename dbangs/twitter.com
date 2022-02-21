#!/usr/bin/env bash

nbrowser_dbang() {
	nitter_domain=${nitter_instance:-https://nitter.net/}
	local TwitterPath=$(expr "$@" : '^https\?://.*\.\?twitter\.com/\(.*\)\?$');
	if [ -z "${TwitterPath}" ] ; then
		open_in_browser "$*"
	else
		open_in_browser "$nitter_domain$TwitterPath"
	fi
}
