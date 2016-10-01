![](http://i.imgur.com/uvCHW7C.jpg)

There is a post going round on facebook of a mug with some code on it.
There's even [a reddit post on it](https://www.reddit.com/r/csharp/comments/3xdikm/does_anybody_know_where_i_can_find_this_mug/?st=itrfyyvi&sh=e8448c85).
The mug looks quite nice but sadly the code on it is crap.

- The code is not placed in a separate namespace
- A `var` keyword is not used when assigning the `Coffee` object
- The object oriented style abstraction is broken
  - There is no container for the coffee
  - There is no dispenser for the coffee
  - There is no person to drink the coffee
  - There is no SoftwareDeveloper object
- There are flaws in the logic
  - When the `coffee` is refilled it is not drunk
  - The logic is only run once
- The comment is totally useless
- The code style does not adhere to the [C# coding standards for .NET](http://se.inf.ethz.ch/old/teaching/ss2007/251-0290-00/project/CSharpCodingStandards.pdf) 
  - Rule 2.3. Do not create declarations of the same type (namespace, class, method, property, field, or parameter) and access modifier (protected, public, private, internal) that vary only by capitalization. 
  - Rule 2.18. Try to prefix Boolean variables and properties with “Can”, “Is” or “Has”.
  - Rule 4.3.33. Avoid invoking methods within a conditional expression. 
- There is no logging, error handling or messaging

Honestly, if I came across such code in a peer review it would not pass.

Beside these issues, the code is written in [C#](https://en.wikipedia.org/wiki/C_Sharp_(programming_language)) (created by Microsoft) and not in the more suitable [CoffeeScript](http://coffeescript.org/)

At a certain point I might feel like writing a better version.

Right now, my coffee mug is empty, so I'm going to get a refill first ;-)