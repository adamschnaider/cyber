#!/bin/bash

sleep 100
/bin/ping -c 5 ${master_ip} > ping_test.txt
