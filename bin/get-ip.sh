#!/bin/bash

ifconfig | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | tail -n 1
