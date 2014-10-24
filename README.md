olddistr_tzdata_updater
=======================

Script updates timezone information on Linux and FreeBSD
You can use it on servers, that can not be updated with its own package manager
You have to chage it to meet your requirements, there is some variables at the begining of that file:

year="2014" - it is year wich has timezone updates that you need

changesinyear=2 - it is number of timezone changes, that have to be in selected year new timezone data. It is used to check if updates are required 

timezone="Asia/Irkutsk" - it is timezone of your pc

tzregion="asia europe" - list of regions that you want to update tzdata for

tzdatalatest="ftp://ftp.iana.org/tz/tzdata-latest.tar.gz" - link to fresh timezone data


