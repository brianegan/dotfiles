#!/bin/bash
nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits
