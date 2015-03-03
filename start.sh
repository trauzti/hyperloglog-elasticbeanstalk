#!/bin/bash

/etc/init.d/redis-server start

python2.7 app.py
