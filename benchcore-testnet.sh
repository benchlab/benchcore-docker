#!/usr/bin/env sh

## BENCHCORE INSTALLER BASH SCRIPT 
## Copyright 2018 Bench Computer, Inc. All rights reserved.
## Use of this source code is governed by the BENCH License
## The BENCH license can be found in the LICENSE file in the root directory of this software.
## This software my utilize other software libraries that are mentioned in benOS License Agreement
## For the license agreement, go to: https://github.com/benchlab/benOS/blob/master/ATTRIBUTES.md
## Using this software to issue illegal securities is prohibited.


## BenchCore Application Input Params
BENCH=/benchcore/${BENCH:-benchcore}
ID=${ID:-0}
LOG=${LOG:-benchcore-testnet.log}

##
## Install BenchCore Application On Linux
##
if ! [ -f "${BENCH}" ]; then
	echo "The BenchCore application $(basename "${BENCH}") was not found. Please add the BenchCore application to the folder inside the '$BENCH' variable within 'benchcore-testnet.sh' . Please use the BENCH environment variable if the name of the BenchCore application is not 'benchcore' E.g.: -e BENCH=customcore"
	exit 1
fi
BENCH_CHECK="$(file "$BENCH" | grep 'ELF 64-bit LSB executable, x86-64')"
if [ -z "${BENCH_CHECK}" ]; then
	echo "Server OS needs to be a flavor of Linux (Ubuntu, Debian, CentOS) or ARCH amd64"
	exit 1
fi

##
## Run BenchCore Application With All Available Params
##
export BCHOME="/benchcore/node${ID}"

if [ -d "`dirname ${BCHOME}/${LOG}`" ]; then
  "$BENCH" "$@" | tee "${BCHOME}/${LOG}"
else
  "$BENCH" "$@"
fi

chmod 777 -R /benchcore
