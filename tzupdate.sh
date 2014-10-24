#!/bin/sh
# script to update timezone data
# on servers with old unsupportted distributives
# 
# PARAMS
# year to check time zone shiftings
year="2014"
# how many timezone chaneges record must be in this year
changesinyear=2
# your timezone
timezone="Asia/Irkutsk"
# fresh timezones file
# usually it is ftp://ftp.iana.org/tz/tzdata-latest.tar.gz
tzdatalatest="ftp://ftp.iana.org/tz/tzdata-latest.tar.gz"
# list of regions that will be upated
tzregion="asia europe"

unamer=`uname`
if [ "$unamer" = "Linux" ]
then
        wgetp="wget"
else
        wgetp="fetch"
fi
echo -n "Before update date: "
date
curstat=`zdump -v /etc/localtime | grep $year -c`
if [ "$curstat" -ne "$changesinyear" ]
then
        echo "Need update!"
        $wgetp $tzdatalatest
        mkdir tzdata
        cd tzdata
        tar xzf ../tzdata-latest.tar.gz
        zic $tzregion
        zic -l /usr/share/zoneinfo/$timezone
        if [ "/usr/share/zoneinfo/$timezone" -nt "../tzdata-latest.tar.gz" ]
        then
                curstat=`zdump -v /etc/localtime | grep $year -c`
                if [ "$curstat" -ne "$changesinyear" ]
                then
                        echo "!!!!!!!!! Failed update"
                else
                        echo "Updated Successfully"
                fi
        else
                echo "!!!!!!!!!! Update failed"
        fi
        echo -n "After update date: "
        date
else
        echo "Already OK!"
fi
