# Backward incompatible changes

There are various minor backward incompatible changes between various versions. This file only focusses on obvious functional or structural changes. For an exhaustive list see the page for that specific PHP version.

## [PHP 5.0]

- `array_merge()` only accepts arrays
- The global `$argc` and `$argv` variables are always available in the CLI version.
- An object with no properties is no longer considered "empty".
- Various functions (`get_class()`, `get_parent_class()` and `get_class_methods()`) and magic constants (`__CLASS__`, `__METHOD__`, and `__FUNCTION__`) are case sensitive when reporting the name of the classes/methods as they are declared.
- Passing an array to a function by value no longer resets the array's internal pointer for that array within the function. 

## [PHP 5.1]

- Code that could potentially produce memory corruption can no longer do so. However, this means that references work slightly different than they did before. The Engine was fixed to 'know' when the reference operation is being used on a value that should not be referenced. 

## [PHP 5.2]

- `SplFileObject::getFilename()` returns the filename, not relative/path/to/file
- magic method `__toString()` will now be called in a string context, that is, anywhere an object is used as a string. 
- Due to an oversight, PHP 5.0.x and 5.1.x allowed abstract static functions in classes. As of PHP 5.2.x, only interfaces can have them.
- The 'data' URL scheme was added  (RFC2397 data: stream).

## [PHP 5.3]

- `realpath()` is now fully platform-independent.
- The `call_user_func()` family of functions now propagate `$this` even if the callee is a parent class.
- The array functions `natsort()`, `natcasesort()`, `usort()`, `uasort()`, `uksort()`, `array_flip()`, and `array_unique()` no longer accept objects as arguments.
- Functions with by-reference parameters called by value has changed now emit a fatal error.
- The trailing slash `/` has been removed from the `SplFileInfo` class and other related directory classes.
- The `__toString()` magic method can no longer accept arguments.
- The magic methods `__get()`, `__set()`, `__isset()`, `__unset()`, and `__call()` must always be public and can no longer be static.
- The `__call()` magic method is now invoked on access to private and protected methods.
- The `func_get_arg()`, `func_get_args()` and `func_num_args()` can no longer be called from the outermost scope of a file that has been included by calling include or require from within a function in the calling file.
- The words `goto` and `namespace` are now reserved keywords.

## [PHP 5.4]

* [Safe mode] is no longer supported.
* [Magic quotes] has been removed.
* The [register_globals] and [register_long_arrays] `php.ini` directives have been removed.
* [Call-time pass by reference] has been removed.
* The [break] and [continue] statements no longer accept variable arguments (e.g., `break 1 + foo() * $bar;`). Static arguments still work, such as `break 2;`.
* In the [date and time extension], the timezone can no longer be set using the TZ environment variable. Instead you have to specify a timezone using the [date.timezone] `php.ini` option or [date_default_timezone_set()] function.
* Non-numeric string offsets - e.g. `$a['foo']` where `$a` is a string - now return `FALSE` on [isset()] and `TRUE` on [empty()], and produce a **`E_WARNING`** when used. Offsets of types double, bool and null produce a **`E_NOTICE`**. $str='abc';var_dump(isset($str['x'])); // false for PHP 5.4 or later, but true for 5.3 or less
* Converting an array to a string will now generate an **`E_NOTICE`** level error.
* Turning **`NULL`**, **`FALSE`**, or an empty string into an object by adding a property will now emit an **`E_WARNING`** level error, instead of **`E_STRICT`**.
* Parameter names that shadow super globals now cause a fatal error. This prohibits code like `function foo($_GET, $_POST) {}`.
* The _Salsa10_ and _Salsa20_ [hash algorithms] have been removed.
* [array_combine()] now returns `array()` instead of `FALSE` when two empty arrays are provided as parameters.
* When [htmlentities()] is used with an asian character sets an `E_STRICT` level error is emitted.
* The third parameter of [ob_start()] has changed from [boolean] `erase` to [integer] `flags`. Please follow [this example][example01] to write code that is compatible with PHP 5.3 and 5.4.
- The words `callable`, `insteadof` and `trait` are now reserved keywords.

## [PHP 5.5]

* All case insensitive matching for function, class and constant names is now performed in a locale independent manner according to ASCII rules.
* Changes were made to [pack()] and [unpack()] to make them more compatible with Perl. The "Z" format is code now supported. Use this instead of "a", as the behaviour of "a" has changed.
* The keywords `self`, `parent` and `static` are now always case insensitive. Prior to PHP 5.5, cases existed where the [self], [parent], and [static] keywords were treated in a case sensitive fashion.
* The GUIDs that previously resulted in PHP outputting various logos have been removed. This includes the removal of the functions to return those GUIDs: `php_logo_guid()`](function.php-logo-guid.php), `php_egg_logo_guid()`,  `php_real_logo_guid()`, [`zend_logo_guid()`]

## [PHP 5.6]

[PHP 5.0]: http://php.net/manual/en/migration5.incompatible.php
[PHP 5.1]: http://php.net/manual/en/migration51.references.php
[PHP 5.2]: http://php.net/manual/en/migration52.incompatible.php
[PHP 5.3]: http://php.net/manual/en/migration53.incompatible.php
[PHP 5.4]: http://php.net/manual/en/migration54.incompatible.php
[PHP 5.5]: http://php.net/manual/en/migration55.incompatible.php
[PHP 5.6]: http://php.net/manual/en/migration56.incompatible.php

[`php_logo_guid()`]: https://php.net/manual/function.php-logo-guid.php)
[`zend_logo_guid()`]: https://php.net/manual/function.zend-logo-guid.php
[array_combine()]: https://php.net/manual/function.array-combine.php
[boolean]: https://php.net/manual/language.types.boolean.php
[break]: https://php.net/manual/control-structures.break.php
[Call-time pass by reference]: https://php.net/manual/language.references.pass.php
[continue]: https://php.net/manual/control-structures.continue.php
[date and time extension]: https://php.net/manual/book.datetime.php
[date_default_timezone_set()]: https://php.net/manual/function.date-default-timezone-set.php
[date.timezone]: https://php.net/manual/datetime.configuration.php#ini.date.timezone
[empty()]: https://php.net/manual/function.empty.php
[example01]: https://php.net/manual/function.ob-start.php#function.ob-start.flags-bc
[hash algorithms]: https://php.net/manual/book.hash.php
[htmlentities()]: https://php.net/manual/function.htmlentities.php
[integer]: https://php.net/manual/language.types.integer.php
[isset()]: https://php.net/manual/function.isset.php
[Magic quotes]: https://php.net/manual/security.magicquotes.php
[ob_start()]: https://php.net/manual/function.ob-start.php
[pack()]: https://php.net/manual/function.pack.php
[parent]: https://php.net/manual/language.oop5.paamayim-nekudotayim.php
[register_globals]: https://php.net/manual/ini.core.php#ini.register-globals
[register_long_arrays]: https://php.net/manual/ini.core.php#ini.register-long-arrays
[Safe mode]: https://php.net/manual/features.safe-mode.php
[self]: https://php.net/manual/language.oop5.paamayim-nekudotayim.php
[static]: https://php.net/manual/language.oop5.late-static-bindings.php
[unpack()]: https://php.net/manual/function.unpack.php