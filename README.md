In the documentation for [ASCIIToSVG][1], in regards to formatting (shape, color, style, etc.) it's [author][2] wrote:

> If you have thoughts on how to do this for lines, please do let me know.

The format that is used for boxes is like this:

    .-------------.  .--------------.
    |[Red Box]    |  |[Blue Box]    |
    '-------------'  '--------------'

    [Red Box]: {"fill":"#aa4444"}
    [Blue Box]: {"fill":"#ccccff"}
    
I would think using the same format that is currently used for boxes could also be used for lines:


    -------------[Red Line]-------------->

    <------------[Red Line]---------------

    [Red Line]: {"fill":"#aa4444"}
    [Blue Line]: {"fill":"#ccccff"}
    

What about vertical lines you say? Same principle applies:


        ^               |
        |               |
        |               |
        |               |
    [Red Line]      [Blue Line]
        |               |
        |               |
        |               |
        |               V

    [Red Line]: {"fill":"#aa4444"}
    [Blue Line]: {"fill":"#ccccff"}
    

As I am not at all aware of the inner workings of the code this may be too simple a suggestion with all sorts of downsides. 
Working from the perspective of Idealized Design, however, this would be my suggestion.

So... Comments?


[1]: https://bitbucket.org/dhobsd/asciitosvg#markdown-header-basics-formatting
[2]: https://9vx.org/~dho/a2s/