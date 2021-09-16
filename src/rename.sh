#!/bin/bash

#for all text files, move the file to the new file denoted by removing the ".txt" part and replacing it with ".asm"
for f in *.txt; do mv -- "$f" "${f%.txt}.asm"; done
