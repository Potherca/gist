## New features in PHP 5.3 (2009)

*   Support for [namespaces](http://php.net/manual/language.namespaces.php) has been added.
*   Support for [Late Static Bindings](http://php.net/manual/language.oop5.late-static-bindings.php) has been added.
*   Support for [jump labels](http://php.net/manual/control-structures.goto.php) (limited goto) has been added.
*   Support for native [Closures](http://php.net/manual/functions.anonymous.php) (Lambda/Anonymous functions) has been added.
*   There are two new magic methods, [__callStatic()](http://php.net/manual/language.oop5.overloading.php#object.callstatic) and [__invoke()](http://php.net/manual/language.oop5.magic.php#object.invoke).
*   [Nowdoc](http://php.net/manual/language.types.string.php#language.types.string.syntax.nowdoc) syntax is now supported, similar to [Heredoc](http://php.net/manual/language.types.string.php#language.types.string.syntax.heredoc) syntax, but with single quotes.
*   It is now possible to use [Heredoc](http://php.net/manual/language.types.string.php#language.types.string.syntax.heredoc)s to initialize static variables and class properties/constants.
*   [Heredoc](http://php.net/manual/language.types.string.php#language.types.string.syntax.heredoc)s may now be declared using double quotes, complementing the [Nowdoc](http://php.net/manual/language.types.string.php#language.types.string.syntax.nowdoc) syntax.
*   [Constants](http://php.net/manual/language.constants.syntax.php) can now be declared outside a class using the _const_ keyword.
*   The [ternary](http://php.net/manual/language.operators.comparison.php#language.operators.comparison.ternary) operator now has a shorthand form: `?:`.
*   The HTTP stream wrapper now considers all status codes from 200 to 399 to be successful.
*   Dynamic access to static methods is now possible<sup>1</sup>
*   [Exceptions](http://php.net/manual/language.exceptions.php) can now be nested<sup>2</sup>
*   A [garbage collector](http://php.net/manual/features.gc.php) for circular references has been added, and is enabled by default.
*   The [mail()](http://php.net/manual/function.mail.php) function now supports logging of sent email via the [mail.log](http://php.net/manual/mail.configuration.php#ini.mail.log) configuration directive. (Note: This only applies to email sent through this function.)


