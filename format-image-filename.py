#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# ZHOU Cheng <c.zhou@live.com>
# Format image filename to "IMG_YYYYMMDD_hhmmss_n.jpg"

import datetime
import os
import sys


def get_image_format_filename(file_path, image_time, file_extension):
    file_name = "IMG_{}.{}".format(image_time.strftime("%Y%m%d_%H%M%S"), file_extension)
    if not os.path.exists(os.path.join(file_path, file_name)):
        return file_name
    n = 1
    while True:
        file_name = "IMG_{}_{}.{}".format(image_time.strftime("%Y%m%d_%H%M%S"), n, file_extension)
        if not os.path.exists(os.path.join(file_path, file_name)):
            return file_name
        n += 1


def rename_file_by_time(file_path, old_name, image_time):
    file_extension = old_name.rsplit(".", 1)[-1]
    new_name = get_image_format_filename(file_path, image_time, file_extension)
    os.rename(os.path.join(file_path, old_name), os.path.join(file_path, new_name))
    print("{} 重命名成 {}".format(old_name, new_name))


def format_image_filename(file_path, file_name):
    image_path = os.path.join(file_path, file_name)
    if not os.path.isfile(image_path):
        print("{} 不存在".format(image_path))
        return
    elif file_name.startswith("IMG_"):
        print("{} 不需要转化".format(file_name))
        return
    elif file_name.startswith("wx_camera_"):
        timestamp = int(file_name[10:20])
        image_time = datetime.datetime.fromtimestamp(timestamp)
        rename_file_by_time(file_path, file_name, image_time)
        return
    elif file_name.startswith("mmexport"):
        timestamp = int(file_name[8:18])
        image_time = datetime.datetime.fromtimestamp(timestamp)
        rename_file_by_time(file_path, file_name, image_time)
        return
    return

if __name__ == '__main__':
    dir_path = sys.argv[1]
    if len(sys.argv) < 2 or (not os.path.isdir(sys.argv[1])):
        print("需要传入图片目录")
        exit()
    for filename in os.listdir(sys.argv[1]):
        format_image_filename(sys.argv[1], filename)
