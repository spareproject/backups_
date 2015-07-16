#!/bin/env bash

a="this is a line"
b="this is"
c="a line"
echo ${a#"$b"}
echo ${a%"$c"}
