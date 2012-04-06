#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os

os.chdir("/home/elfo/GIT/CODEX/codex/web/tools/")  # FIXME
stop_words_file = open("stopwords.txt", "r")
stop_words_list = [word.strip() for word in stop_words_file.readlines()]

if __name__ == "__main__":

    stop_words_file = open("stopwords.txt", "r")
    stop_words_list = [word.strip() for word in stop_words_file.readlines()]
