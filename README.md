# Kakoune Rectangles

## Dependencies
It requires perl6/raku for the script that does the magic, if someone
wants to port it to perl5 it would be cool, I really dont feel like
doing it myself, right now raku is kinda slow so your pr is welcome!

sometimes you need to select a portion of text that has the shape of a ` R E C T A N G L E`,
but usually you have to press many times `C` or even worse `<a-C>`, with this plugin
you can just turn your main selection into a rectangle quite easily.

## Note
Be mindful that tabs are treated as a single character, thus
if your selection contains lines with different ammount of tabs the produced rectangle will most likely
have a weird length.

![1](https://github.com/eko234/kakoune-rectangles/blob/main/rect1.png)
![2](https://github.com/eko234/kakoune-rectangles/blob/main/rect2.png)
![3](https://github.com/eko234/kakoune-rectangles/blob/main/rect3.png)
![4](https://github.com/eko234/kakoune-rectangles/blob/main/rect4.png)
