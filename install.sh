#!/bin/sh

for directory in */;
do stow "${directory}";
done
