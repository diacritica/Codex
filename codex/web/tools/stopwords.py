#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os

os.chdir("/srv/codex_virtualenv/Codex.git/codex/web/tools/")  # FIXME
stop_words_file = open("stopwords.txt", "r")
stop_words_list = [word.strip() for word in stop_words_file.readlines()]

if __name__ == "__main__":

    stop_words_file = open("stopwords.txt", "r")
    stop_words_list = [word.strip() for word in stop_words_file.readlines()]
    print stop_words_list
