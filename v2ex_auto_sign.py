#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# ZHOU Cheng <c.zhou@live.com>
# v2ex.com 自动签到工具
# usage: ./v2ex_auto_sign.py username password

import datetime
import re
import sys

import requests


class V2EX(object):
    def __init__(self, username, password):
        self.username = username
        self.password = password
        self.session = requests.Session()
        self.is_login = False

    def login(self):
        if self.is_login:
            return self.is_login
        login_page = self.session.get('https://www.v2ex.com/signin').text
        payload = {
            re.findall('type="text" class="sl" name="(\w{64})"', login_page)[0]: self.username,
            re.findall('type="password" class="sl" name="(\w{64})"', login_page)[0]: self.password,
            'next': '/',
            'once': re.findall('value="(\d+)" name="once"', login_page)[0],
        }
        sign_in_resp = self.session.post(
            'https://www.v2ex.com/signin',
            data=payload, headers={'Referer': 'https://www.v2ex.com/signin'})
        if sign_in_resp.text.find('signout') == -1:
            self.is_login = False
            print('{} {} login fail.'.format(datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'), self.username))
        else:
            self.is_login = True
            print('{} {} login success.'.format(datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'), self.username))
        return self.is_login

    def sign(self):
        if not self.is_login:
            self.login()
        if not self.is_login:
            print('login error.')
            return
        if self.session.get('https://www.v2ex.com/mission/daily').text.find('fa-ok-sign') != -1:
            print('{} {} already signed.'.format(datetime.datetime.now().strftime('%Y-%m-%d'), self.username))
            return
        try:
            daily_token = re.findall('(mission/daily/redeem\?once=\d+)',
                                     self.session.get('https://www.v2ex.com/mission/daily').text)[0]
            self.session.get(
                'https://www.v2ex.com/{token}'.format(token=daily_token),
                headers={'Referer': 'https://www.v2ex.com/mission/daily'})
            print('{} {} signed.'.format(datetime.datetime.now().strftime('%Y-%m-%d'), self.username))
        except Exception as e:
            print('{} {} sign error {}'.format(datetime.datetime.now().strftime('%Y-%m-%d'), self.username, e))


if __name__ == '__main__':
    if len(sys.argv) < 3:
        print('Please input username and password')
        exit()
    user = V2EX(sys.argv[1], sys.argv[2])
    user.sign()
