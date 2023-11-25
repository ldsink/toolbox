#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# ZHOU Cheng <c.zhou@live.com>
# Format image filename to 'IMG_YYYYMMDD_hhmmss_n.jpg'

import datetime
import os
import sys
import time


def get_image_format_filename(file_path, image_time, file_extension):
    file_name = 'IMG_{}.{}'.format(image_time.strftime('%Y%m%d_%H%M%S'), file_extension)
    if not os.path.exists(os.path.join(file_path, file_name)):
        return file_name
    n = 1
    while True:
        file_name = 'IMG_{}_{}.{}'.format(image_time.strftime('%Y%m%d_%H%M%S'), n, file_extension)
        if not os.path.exists(os.path.join(file_path, file_name)):
            return file_name
        n += 1


def rename_file_by_time(file_path, old_name, image_time):
    file_extension = old_name.rsplit('.', 1)[-1]
    new_name = get_image_format_filename(file_path, image_time, file_extension)
    os.rename(os.path.join(file_path, old_name), os.path.join(file_path, new_name))
    print('{} 重命名成 {}'.format(old_name, new_name))


def format_image_filename(file_path, file_name):
    image_path = os.path.join(file_path, file_name)
    if not os.path.isfile(image_path):
        print('{} 不存在'.format(image_path))
        return
    elif file_name.startswith('IMG_'):
        return

    timestamp = None
    if file_name.startswith('wx_camera_'):
        # Example: wx_camera_1485925660871.jpg
        timestamp = int(file_name[10:20])
    elif file_name.startswith('mmexport'):
        # Example: mmexport1483794982818.jpg
        timestamp = int(file_name[8:18])
    elif file_name.startswith('microMsg.'):
        # Example: microMsg.1435764349881.jpg
        timestamp = int(file_name[9:19])
    elif file_name.startswith('微信图片_'):
        # Example: 微信图片_20180323230724
        timestamp = time.strptime(file_name[5:19], "%Y%m%d%H%M%S")
        timestamp = time.mktime(timestamp)
    if timestamp:  # image file in examples, rename it.
        image_time = datetime.datetime.fromtimestamp(timestamp)
        rename_file_by_time(file_path, file_name, image_time)


if __name__ == '__main__':
    current_path = os.getcwd()
    if len(sys.argv) > 2 and (not os.path.isdir(sys.argv[1])):
        current_path = sys.argv[1]
    for filename in os.listdir(current_path):
        format_image_filename(current_path, filename)
