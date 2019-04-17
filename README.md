# fancyArticle

fancyArticle is the class file I use for most writing. It mostly just allows me to have a somewhat cleaner preamble. Most of the file was written in 2015 while I was reading Bringhurst's *The Elements of Typographic Style*.

It is built on top of the [Memoir class](http://texdoc.net/texmf-dist/doc/latex/memoir/memman.pdf), and uses the [Libertinus](https://github.com/libertinus-fonts/libertinus) typeface family. Files using this class file must be compiled with XeLaTeX. 

## Dependecies

1. XeLatex. All documents using this class must be compiled with this. Should be included in most common TeX distros.
2. OpenType [Libertinus Font Family](https://github.com/libertinus-fonts/libertinus) (Users of Arch and its descendants can install from the AUR as "otf-libertinus")
3. A variety of other LaTeX packages. None should be non-standard, but all loaded packages are at the start of the file in case you happen to be using a minimalist TeX install.

## Usage

Simply copy the cls file into the same directory as your .tex file and use \documentclass{fancyArticle}. Any options passed will be passed to the Memoir class.

## Future work

Write a bash script to install the cls file to avoid having to copy the file into every project folder...
