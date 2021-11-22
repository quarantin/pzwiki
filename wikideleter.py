#!/usr/bin/env python

import sys

from wiki import Wiki

if __name__ == '__main__':
	deleter = Wiki()
	titles = sys.stdin.read().strip().split('\n')
	for title in titles:
		deleter.delete_page(title)
