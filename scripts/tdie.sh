#!/bin/bash
sensors | awk '/Tctl/ {print $2}' | sed 's/.$//' | sed 's/+//'
