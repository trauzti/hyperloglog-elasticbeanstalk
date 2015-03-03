#!/bin/bash

/etc/init.d/redis-server start

python2.7 /src/app.py
