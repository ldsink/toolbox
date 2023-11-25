#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import contextlib
import subprocess


def get_images():
    proc = subprocess.Popen(["docker", "images"], stdout=subprocess.PIPE)
    row = 0
    while True:
        line = proc.stdout.readline()
        if not line:
            break
        line = line.decode().strip().split(" ")
        line = [_ for _ in line if _]
        row += 1
        if row == 1:
            continue
        with contextlib.suppress(Exception):
            if line[1] == "<none>":
                cmd = ["docker", "rmi", line[2]]
            else:
                cmd = ["docker", "rmi", f"{line[0]}:{line[1]}"]
            print(cmd)
            subprocess.run(cmd)


if __name__ == "__main__":
    get_images()
