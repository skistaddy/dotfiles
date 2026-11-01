#!/usr/bin/env bash
dir=$HOME/screenshots
mkdir -p $dir

file=$dir/$(date '+%Y-%m-%d_%H-%M-%S').png
grimblast copysave area $file
