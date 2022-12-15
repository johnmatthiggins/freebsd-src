#!/usr/bin/env sh

# XATTR_ON="$(zfs get xattr | grep on | wc -l)"
# XATTR_ACTUAL="$(zfs get xattr | tail -n +2 | wc -l)"

# printf "%s\n%s\n" $XATTR_ON $XATTR_ACTUAL

TMP1="$(mktemp)"
TMP2="$(mktemp)"

setextattr user name TEST $TMP1
ACTUAL="$(getextattr user name $TMP1)"
EXPECTED="$TMP1 TEST"

../cp -a $TMP1 $TMP2

ACTUAL="$(getextattr user name $TMP2)"
EXPECTED="$TMP2 TEST"

printf "EXPECTED:\t%s %s\n" $EXPECTED
printf "ACTUAL:\t\t%s %s\n" $ACTUAL

rm $TMP1
rm $TMP2
