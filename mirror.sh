#!/bin/bash

source config.sh

wget --load-cookies $cookies \
--post-data='username=$username&password=$password&testcookies=1' \
--save-cookies=my-cookies.txt \
--keep-session-cookies $url \
--delete-after

wget --load-cookies $cookies \
--keep-session-cookies --save-cookies $cookies \
--referer=$loginurl -m -E -k \
--reject logout*,*cal_m*,*cal_y*,post.php*,*subscribe*,help.php*,enrol.php* \
--exclude-directories=/calendar $url
