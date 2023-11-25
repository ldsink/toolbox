#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# ZHOU Cheng <c.zhou@live.com>

import collections
import datetime
import os
import random
import shutil
import sys

user_backup_list = collections.OrderedDict([
    # (restore_path, backup_path),
    ('~/.vimrc', '.vimrc'),
    ('~/.ssh', '.ssh'),
    ('~/.pip', '.pip'),
    ('~/.fonts', '.fonts'),
    ('~/.oh-my-zsh', '.oh-my-zsh'),
    ('~/.zshrc', '.zshrc'),
    ('~/.gitconfig', '.gitconfig'),
])


def get_full_path(path):
    if path.startswith('~/'):
        return os.path.join(os.path.expanduser('~'), path[2:])
    return path


def backup():
    backup_path = '/tmp/{}'.format(backup_file)
    os.mkdir(backup_path)
    for _src, _dst in user_backup_list.items():
        _src = get_full_path(_src)
        _path = os.path.join(backup_path, _dst)
        print('Backup {} ...'.format(_src))
        if os.path.isdir(_src):
            shutil.copytree(_src, _path)
        else:
            shutil.copy(_src, _path)
    shutil.make_archive('{}'.format(backup_file), 'zip', backup_path)
    shutil.rmtree(backup_path)
    print('Archive data to {}.zip'.format(backup_file))


def restore():
    # todo restore from backup file
    pass


if __name__ == '__main__':
    backup_file = None
    if len(sys.argv) > 1:  # input backup file to restore
        backup_file = sys.argv[1]
    print('Preparing to {} ...'.format('restore {}'.format(backup_file) if backup_file else 'backup'))

    if backup_file:
        restore()
    else:
        backup_file = 'backup_{}_{}'.format(datetime.datetime.now().strftime('%Y%m%d%H%M%S'), random.randint(1, 100000))
        backup()
    print('Done.')
