#!/bin/bash

# 1 Clear PageCache only
# 2 Clear dentries and inodes
# 3 Clear pagecache, dentries, and inodes
echo "echo 1 > /proc/sys/vm/drop_caches"
