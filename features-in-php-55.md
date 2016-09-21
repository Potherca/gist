## New features in PHP 5.5 (2013)

### [Generators](http://php.net/manual/language.generators.php) added

Support for [generators](http://php.net/manual/language.generators.php) has been added via the **yield** keyword. Generators provide an easy way to implement simple iterators without the overhead or complexity of implementing a class that implements the [Iterator](http://php.net/manual/class.iterator.php) interface. <sup>3</sup>

### [_finally_](http://php.net/manual/language.exceptions.php#language.exceptions.finally) keyword added

[_try_](http://php.net/manual/language.exceptions.php)-[_catch_](http://php.net/manual/language.exceptions.php#language.exceptions.catch) blocks now support a [_finally_](http://php.net/manual/language.exceptions.php#language.exceptions.finally) block for code that should be run regardless of whether an exception has been thrown or not.

### New password hashing API

A [new password hashing API](http://php.net/manual/book.password.php) that makes it easier to securely hash and manage passwords using the same underlying library as [crypt()](http://php.net/manual/function.crypt.php) in PHP has been added. See the documentation for [password_hash()](http://php.net/manual/function.password-hash.php) for more detail.

### [_foreach_](http://php.net/manual/control-structures.foreach.php) now supports [list()](http://php.net/manual/function.list.php)

The [foreach](http://php.net/manual/control-structures.foreach.php) control structure now supports unpacking nested arrays into separate variables via the [list()](http://php.net/manual/function.list.php) construct. <sup>4</sup>

### [empty()](http://php.net/manual/function.empty.php) supports arbitrary expressions

Passing an arbitrary expression instead of a variable to [empty()](http://php.net/manual/function.empty.php) is now supported. <sup>5</sup>

### [array](http://php.net/manual/language.types.array.php) and [string](http://php.net/manual/language.types.string.php) literal dereferencing

[Array](http://php.net/manual/language.types.array.php) and [string](http://php.net/manual/language.types.string.php) literals can now be dereferenced directly to access individual elements and characters. <sup>6</sup>

### Class name resolution via [::class](http://php.net/manual/language.oop5.basic.php#language.oop5.basic.class.class)

It is possible to use _ClassName::class_ to get a fully qualified name of class _ClassName_. <sup>7</sup>

### [OPcache](http://php.net/manual/book.opcache.php) extension added

The Zend Optimiser+ opcode cache has been added to PHP as the new [OPcache extension](http://php.net/manual/book.opcache.php). OPcache improves PHP performance by storing precompiled script bytecode in shared memory, thereby removing the need for PHP to load and parse scripts on each request. See [the installation instructions](http://php.net/manual/opcache.installation.php) for more detail on enabling and using OPcache.

### [_foreach_](http://php.net/manual/control-structures.foreach.php) now supports non-scalar keys

[foreach](http://php.net/manual/control-structures.foreach.php) now supports keys of any type. While non-scalar keys cannot occur in native PHP arrays, it is possible for [Iterator::key()](http://php.net/manual/iterator.key.php) to return a value of any type, and this will now be handled correctly.

### Apache 2.4 handler supported on Windows

The Apache 2.4 handler SAPI is now supported on Windows.

### Improvements to GD

Various improvements have been made to the GD extension, these include:

*   Flipping support using the new [imageflip()](http://php.net/manual/function.imageflip.php) function.
*   Advanced cropping support using the [imagecrop()](http://php.net/manual/function.imagecrop.php) & [imagecropauto()](http://php.net/manual/function.imagecropauto.php) functions.
*   WebP read and write support using [imagecreatefromwebp()](http://php.net/manual/function.imagecreatefromwebp.php) & [imagewebp()](http://php.net/manual/function.imagewebp.php) respectively.



