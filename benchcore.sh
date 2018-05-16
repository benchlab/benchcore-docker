#!/usr/bin/env sh

##
## BenchCore Application Input parameters
##
BENCH=/benchcore/${BENCH:-benchcore}
ID=${ID:-0}
LOG=${LOG:-benchcore.log}

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
