# Minecraft Language JSON De-Obfuscation

## About

De-obfuscates Minecraft language files and try to find block/items with the longest name.

## Reference

- https://www.youtube.com/watch?v=bBAhnThGR4g
- https://minecraft.wiki/w/Tutorials/Sound_directory#Extracting_Minecraft_music_on_Linux

## Setup

- Setup `.minecraft/assets/indexes` and `.minecraft/assets/objects` in `extractor.sh`
- Run `./extractor.sh`
- Run `python parse.py`

## Example

```
$ python parse.py
Threshold: 56,  Length: 56      so_so.json      block.minecraft.polished_blackstone_brick_stairs      Jaranjarada Dhagaxa ah ee loo yaqaan 'Blackstone Briit'
Threshold: 56,  Length: 56      eu_es.json      block.minecraft.waxed_exposed_cut_copper_stairs       Ezkoztatutako moztutako kobrezko eskailera estalgabetuak
Threshold: 56,  Length: 56      lol_us.json     block.minecraft.chain_command_block     Alpha Block Dat Duz A Congo Line With Other Alpha Blocks
Threshold: 56,  Length: 59      nah.json        block.minecraft.waxed_exposed_cut_copper_slabTlaxikokwitlaltilli tlanēxtililli tehtekki amochiitstapalli
Threshold: 56,  Length: 58      nah.json        block.minecraft.waxed_exposed_cut_copper_stairs       Tlaxikokwitlaltilli tlanēxtililli tehtekki amochimamatlatl
Threshold: 56,  Length: 59      en_pt.json      block.minecraft.waxed_exposed_cut_copper_stairs Stairs o' waxen' Anti-Moss Spread Showin' Copper o' Slicin'
Threshold: 56,  Length: 56      szl.json        block.minecraft.waxed_weathered_cut_copper_stairs       Waksowane strzedniŏ utlyniōne rzezane miydzianne schodki

Max: Length: 59 nah.json        block.minecraft.waxed_exposed_cut_copper_slab   Tlaxikokwitlaltilli tlanēxtililli tehtekki amochiitstapalli
```
