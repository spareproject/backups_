#!/bin/env bash

STRING0="this would be some text"
STRING1="some text"
STRING2="this would be"

echo "${STRING0} #(prefix) ${STRING1}"
echo ${STRING0#$STRING1}
echo "${STRING0} %(suffix} ${STRING1}"
echo ${STRING0%$STRING1}

echo "${STRING0} #(prefix) ${STRING2}"
echo ${STRING0#$STRING2}
echo "${STRING0} %(suffix) ${STRING2}"
echo ${STRING0%$STRING2}

TEST=${STRING0%$STRING1}

echo "TEST:${TEST}"
