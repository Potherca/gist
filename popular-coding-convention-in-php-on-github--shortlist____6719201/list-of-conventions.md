The following list contains all of the conventions I can think of to include in 
the convention list. It is based on a comparison of various conventions as 
dictated by various more well-know projects.

Some of these may be dropped under influence of comments or lack of good 
examples.


Whitespace
----------------------------------------------
 - File Encoding
 - Brace Placement (Class/Control Structures/Methods)
 - Blank line after `<?php` opening token
 - Indentation (general/switch)
 - Line Endings
 - Space (Control Structure Brackets/Around Param Block/Method Declaration Inside Param Block)


Naming Convention
----------------------------------------------
 - Class Names
 - Class Constant Names
 - Class Method Names
 - Class Variable Names
 - Constant Names
 - Function Names
 - Namespace Usage
 - PHP Constants Casing
 - PHP Keyword Casing

Other
----------------------------------------------
 - Method Declare Order
 - Dockblocks
 - Closing Tags
 - Short Tags (general/echo)
 - Always use Control braces

 Castaways and Cutouts
----------------------------------------------

There are several things mentioned that I don't think fall under "code style 
clash" but rather good/bad practices. I don't think these need to be included. 
Also, various things might be too tricky to measure and should be left out 
because of that.

 - Class name prefixes and suffixes :
   In lue of using proper namespace features (older) code often falls back to 
   using snake case and prefixes for vendors, etc. I think this will be 
   reflected in the naming convention checks and doesn't warrent this level of
   detail.
 - Comments and documentation blocks :
   Various styles could be easy to check, like `//`, `#` and `/**/`. However, 
   there would have to be a check to take docblocks into account `/** */`, 
   otherwise that would throw everyting of in favour of `/**/`. 
 - Conventions for file names :
   There are various conventions on how to name a file depending on whether it
   contains a class, config or other forms of content but I don't think this 
   could be reliably measured.
 - Declaration of global variables and global constants :
   Doesn't seem worth the effort to gauge this.
 - Declaration of Functions :
   Check whether people only declare functions as class methods or as procedural
   functions. Do we care? I think this is more context dependant than coding or
   convention style.
 - Error Level :
   This one is alsorather ambiguous as often the error level is declared outside
   of the project code. There could be a check for usage of `error_reporting` 
   but then integers could be used instead of constants, making the whole thing
   more tiresome than seems worth the effort.
 - Operators and assignment (Yoda Conditions/Left Side Comparison) :
   This would be hard to reliably check for without doing extra code analysis 
   (scan for the dollar sign `$`). Could be worthwhile to find out. Not sure.
 - Inter-line alignment (Vertical Lining Up Values) :
   Why bother? People hardly seem to notice the difference as is.
 - Line Length (hard limit/soft Limit) :
   I have a feeling this would rather hard to check for, since normative lines 
   of code will be less than 80 characters long anyway.
 - Usage of include_once versus require_once? :
   Doesn't seem worth the effort and can very likely be context dependant.
 - Usage of underscore '_' for private/protected properties :
   This is a bit of PHP4 legacy. The PSR explicitly says "do not use", some 
   others explicitly say yes. Could be interesting. Not sure.

__EOF__ 
