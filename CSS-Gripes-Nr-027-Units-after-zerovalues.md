On the subject of omitting units (`%`, `px`, `em`, etc.) after zeros or not, I 
am a proponent of omitting the unit.

For me this is a case of

 - Brevity
 - Clarity
 - Error-proneness
 - Readability
 - Validity

Especially when working with a changing team and/or on larger projects.

## Brevity

You are probably familiar with the following sayings:

- Less = More
- [YAGNI](http://en.wikipedia.org/wiki/YAGNI)
- [Perfection is attained when there is no longer anything to take away][perfection-quote]

These are popular for a reason. Less bytes = more speed, Less code = better quality, etc.

Just as you would use shorthand, leave out what you don't need. Strip units after 0.

## Clarity

If the exact meaning of code is not *instantly* clear you will have to stop your
train of thought and go find out what the code was *actually* meant to do.

If you see `0px`, does that mean someone forgot to remove the `px` or did 
someone accidentally remove the `1` from a `10px` value? 

Browser *should* display the value as they were declared in the CSS (although 
there are no guaranties here). Various tools, however, are less likely to leave
your CSS intact (like the [W3C CSS Validator]).

## Error-proneness

One argument raised in favour of adding units is that it is easier to spot a 
missing space. 

In the following code, both instances have the same mistake, but only the second 
instance is marked as a CSS error (both by browsers and by validators)

    .foo {
        margin: 00 1px 0;       /* is read as "margin: 0 1px 2px;" Uh-oh! */
    }

    .bar {
        margin: 0px0px 1px 0px; /* Invalid property value / Unknown dimension */
    }

The second instance is arguably also easier to spot with the eye.

Although I am a very big supporter of being able to "see" when code is wrong, I
believe you should not depend on the human eye to spot errors that can be (very) 
easily caught by a machine. In this case, however, the machine does not seem to 
be doing such a good job. 

Instead of having to add units to zero's *everywhere*, I would rather just add 
an improvement to the CSS Linter I use in *one single* place to fix the same 
problem.

## Readability

Omitting the units gives a better signal to noise ratio. Take the following 
example:

    .foo {
        margin: 0 0 1px 2px;
    }

    .bar {
        margin: 0px 0px 1px 0px;
    }

Values that are non-zero occupy more space, signifying they have (more) value. 
Adding units to zero's removes this visual cue.

Class `foo` has a signal/noise ration of 1:0. That is to say, **all** characters
convey meaning.

For class `bar` this degrades to 8:4 = 2:1, one-third of the characters can be 
omitted without the code losing any meaning.

## Validity

Quoting from [the Google Style-guide]:
  
> Using valid CSS is a measurable baseline quality attribute that allows to spot 
> CSS code that may not have any effect and can be removed, and that ensures 
> proper CSS usage.

Although [the standard states that omitting the unit after 0 is optional][w3c-css-spec], 
most decent tools disagree and will give a warning when they see `0em`. The 
easiest way to avoid false positives is to just leave the units out.

## Anything else?

If there is another (counter) argument I have missed, let me know and I will 
add it to the list.

[@Potherca]

[Google Style-guide]: https://google-styleguide.googlecode.com/svn/trunk/htmlcssguide.xml?showone=CSS_Validity#CSS_Validity
[W3C CSS Validator]: http://jigsaw.w3.org/css-validator/validator
[perfection-quote]: http://english.stackexchange.com/questions/38837/where-does-this-translation-of-saint-exuperys-quote-on-design-come-from
[w3c-css-spec]: http://www.w3.org/TR/CSS21/syndata.html#values
[@Potherca]: https://twitter.com/potherca