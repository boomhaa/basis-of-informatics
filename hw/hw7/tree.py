#!/usr/bin/env python3

import argparse
import os
import sys


def get_tree(directories_only, path='.'):
    def recursive_get_tree(path):
        try:
            all = os.listdir(path)
        except:
            return {'files': []}

        if directories_only:
            files = []
        else:
            files = [file for file in all if os.path.isfile(f'{path}/{file}')]
        directories = [file for file in all if os.path.isdir(f'{path}/{file}')]
        dir_dict = {'files': files}
        for directory in directories:
            dir_dict[directory] = recursive_get_tree(f'{path}/{directory}')
        return dir_dict

    return {path: recursive_get_tree(path)}


def write_tree(tree, path):
    if path is not None:
        sys.stdout = open(path, 'w+', encoding="utf-8")
    root = list(tree.keys())[0]
    con = '├── '
    end = '└── '
    line = '│'
    more_space = '   '
    print(root)

    def rec_write_tree(tree, pref):
        if len(tree['files'])>0:
            for file in tree['files'][:-1]:
                print(pref + con + file)
            if len(list(tree.keys())[:-1]) > 0:
                print(pref + con + tree['files'][-1])
            else:
                print(pref + end + tree['files'][-1])
        if len(list(tree.keys())[1:]) > 0:
            for directory in list(tree.keys())[1:][:-1]:
                print(pref + con + directory)
                rec_write_tree(tree[directory], pref+f'{line}{more_space}')
            print(pref + end + list(tree.keys())[-1])
            rec_write_tree(tree[list(tree.keys())[-1]], pref+f' {more_space}')

    rec_write_tree(tree[root], '')


def main():
    parse = argparse.ArgumentParser()
    parse.add_argument('-o', dest='output_file')
    parse.add_argument('-d', dest='directories', action='store_true')
    args, paths = parse.parse_known_args()
    for path in paths:
        if not os.path.exists(path) or not os.path.isdir(path) or not os.access(path, os.R_OK):
            print(f'{__file__} не удалось открыть директорию {path}')
        else:
            write_tree(get_tree(args.directories, path), args.output_file)
    if len(paths) == 0:
        write_tree(get_tree(args.directories, '.'), args.output_file)


if __name__ == "__main__":
    main()
