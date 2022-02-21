#!/usr/bin/env bash

nbrowser_dbang() {
	scribe_domain=${scribe_instance:-https://scribe.rip/}
	local MediumPath=$(expr "$@" : '^https\?://.*\.\?medium\.com/\(.*\)\?$');
	if [ -z "${MediumPath}" ] ; then
		open_in_browser "$*"
	else
		open_in_browser "$scribe_domain$MediumPath"
	fi
}
