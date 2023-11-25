#!/bin/bash

# 1 Clear pagecache only
# 2 Clear dentries and inodes
# 3 Clear pagecache, dentries, and inodes
# Note, we are using "echo 3", but it is not recommended in production
echo 3 > /proc/sys/vm/drop_caches

# Set in Crontab for auto clear memory cache
# For example, clear cache every 2 hours
# 0 */2  *  *  * /path/to/clearcache.sh
