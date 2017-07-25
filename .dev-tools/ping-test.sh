#!/bin/bash
# Ping Testing Script for Badd Boyz Hosts to check if Hosts file is working

do_ping1() {
    if ping -nq -w5 -c1 000free.us | fgrep -q '127.0.0.1'; then
        echo "Hosts File Working"
    else
        echo "Hosts File NOT Working"
        exit 1
	fi
}

do_ping2() {
    if ping -nq -w5 -c1 1millionusd.xyz | fgrep -q '127.0.0.1'; then
        echo "Hosts File Working"
    else
        echo "Hosts File NOT Working"
        exit 1
	fi
}

do_ping3() {
    if ping -nq -w5 -c1 porndairy.in | fgrep -q '127.0.0.1'; then
        echo "Hosts File Working"
    else
        echo "Hosts File NOT Working"
        exit 1
	fi
}

do_ping4() {
    if ping -nq -w5 -c1 olympescort.com | fgrep -q '127.0.0.1'; then
        echo "Hosts File Working"
    else
        echo "Hosts File NOT Working"
        exit 1
	fi
}

do_ping5() {
    if ping -nq -w5 -c1 zx6.ru | fgrep -q '127.0.0.1'; then
        echo "Hosts File Working"
    else
        echo "Hosts File NOT Working"
        exit 1
	fi
}

do_ping1
do_ping2
do_ping3
do_ping4
do_ping5

exit 0
done
