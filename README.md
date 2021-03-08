## night_writer

2102 Mod-1 Final Solo Project

GOAL:  Create functional Ruby program that process a text file containing English characters (consisting of " !',-.?abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ").  From that text, to generate Braille-like text (per the Braille tactile writing system).


### Iteration 1 -- Command Line Interface

Resulting in a confirmation message to terminal like below:
```
$ ruby ./lib/night_writer.rb message.txt braille.txt
Created 'braille.txt' containing 256 characters
```


### Iteration 2 -- Write Braille from English Letters

Update your existing program so that you can create a new file containing characters representing Braille (a two-by-three grid of dots to represent characters).


### Iteration 3 -- Write English Letters from Braille

Resulting in a confirmation message to terminal like below:
```
$ ruby ./lib/night_reader.rb braille.txt original_message.txt
Created 'original_message.txt' containing 256 characters.
```


### Iteration 4: Refactor & Support Additional Characters

Complete two of the following:

#### Extract a File I/O class

#### Support Capitalization

#### Support Numbers

####Support Contractions
