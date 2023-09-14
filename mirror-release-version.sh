#!/bin/env bash

version="$1"
if [ -z "$version" ]; then
	echo "Version argument required" >&2
	exit 1
fi

bin_name="sentry-cli-Linux-x86_64"
download_url="https://github.com/getsentry/sentry-cli/releases/download/${version}/${bin_name}"
wget "$download_url"

chmod 555 $bin_name
tar -czvf "sentry-cli_${version}.tar.gz" "$bin_name"
/bin/rm $bin_name 
git commit -a -m "Mirror version ${version}"
git push
