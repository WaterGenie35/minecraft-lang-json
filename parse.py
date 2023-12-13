#!/usr/bin/python

from os import listdir
from os.path import isfile, join
import json

LANGUAGE_FOLDER = './out/minecraft/lang'
KEY_TYPES = ['block', 'item', 'trim_pattern']
KEY_BLACKLIST = [
    'block.minecraft.bed.no_sleep',
    'block.minecraft.bed.not_safe',
    'block.minecraft.bed.too_far_away',
    'block.minecraft.bed.obstructed',
    'block.minecraft.spawn.not_valid',
    'item.minecraft.smithing_template.netherite_upgrade.base_slot_description'
]
PREFIX_BLACKLIST = [
    'block.minecraft.banner'
]


def main():
    progress = Progress()
    for lang, lang_data in getLanguageJSON():
        for key, text in lang_data.items():
            if shouldBeIncluded(key):
                progress.update(lang, key, text, print_threshold=56)
    print(f"\nMax: {progress}")


def getLanguageJSON():
    for lang in listdir(LANGUAGE_FOLDER):
        path = join(LANGUAGE_FOLDER, lang)
        if isfile(path):
            with open(path) as lang_file:
                lang_data = json.load(lang_file)
                yield lang, lang_data


def shouldBeIncluded(key: str) -> bool:
    key_prefix = key.split(".")[0]
    is_correct_type = key_prefix in KEY_TYPES
    is_blacklisted = key in KEY_BLACKLIST
    is_prefix_blacklisted = any([ True for prefix_blacklist in PREFIX_BLACKLIST if prefix_blacklist in key ])
    return is_correct_type and (not is_blacklisted) and (not is_prefix_blacklisted)


class Progress:
    def __init__(self):
        self.lang = ''
        self.key = ''
        self.text = ''
        self.length = 0
    
    def update(self, lang, key, text, print_progress=False, print_threshold=float('inf')):
        new_length = len(text)
        if new_length > self.length:
            self.lang = lang
            self.key = key
            self.text = text
            self.length = new_length
            if print_progress:
                print(self)
        if new_length >= print_threshold:
            print(f"Threshold: {print_threshold},\tLength: {new_length}\t{lang}\t{key}\t{text}")
    
    def __str__(self) -> str:
        return f"Length: {self.length}\t{self.lang}\t{self.key}\t{self.text}"
    

if __name__ == '__main__':
    main()
