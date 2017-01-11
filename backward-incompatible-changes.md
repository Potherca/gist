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
- The keywords `goto` and `namespace` are now reserved keywords.

## [PHP 5.4]

* [Safe mode](features.safe-mode.php) is no longer supported.
* [Magic quotes](security.magicquotes.php) has been removed.
* The [register_globals](ini.core.php#ini.register-globals) and [register_long_arrays](ini.core.php#ini.register-long-arrays) `php.ini` directives have been removed.
* [Call-time pass by reference](language.references.pass.php) has been removed.
* The [break](control-structures.break.php) and [continue](control-structures.continue.php) statements no longer accept variable arguments (e.g., `break 1 + foo() * $bar;`). Static arguments still work, such as `break 2;`.
* In the [date and time extension](book.datetime.php), the timezone can no longer be set using the TZ environment variable. Instead you have to specify a timezone using the [date.timezone](datetime.configuration.php#ini.date.timezone) `php.ini` option or [date_default_timezone_set()](function.date-default-timezone-set.php) function.
* Non-numeric string offsets - e.g. `$a['foo']` where `$a` is a string - now return `FALSE` on [isset()](function.isset.php) and `TRUE` on [empty()](function.empty.php), and produce a **`E_WARNING`** when used. Offsets of types double, bool and null produce a **`E_NOTICE`**. $str='abc';var_dump(isset($str['x'])); // false for PHP 5.4 or later, but true for 5.3 or less
* Converting an array to a string will now generate an **`E_NOTICE`** level error.
* Turning **`NULL`**, **`FALSE`**, or an empty string into an object by adding a property will now emit an **`E_WARNING`** level error, instead of **`E_STRICT`**.
* Parameter names that shadow super globals now cause a fatal error. This prohibits code like `function foo($_GET, $_POST) {}`.
* The _Salsa10_ and _Salsa20_ [hash algorithms](book.hash.php) have been removed.
* [array_combine()](function.array-combine.php) now returns `array()` instead of `FALSE` when two empty arrays are provided as parameters.
* When [htmlentities()](function.htmlentities.php) is used with an asian character sets an `E_STRICT` level error is emitted.
* The third parameter of [ob_start()](function.ob-start.php) has changed from [boolean](language.types.boolean.php) `erase` to [integer](language.types.integer.php) `flags`. Please follow [this example](function.ob-start.php#function.ob-start.flags-bc) to write code that is compatible with PHP 5.3 and 5.4.

## [PHP 5.5]

## [PHP 5.6]

[PHP 5.0]: http://php.net/manual/en/migration5.incompatible.php
[PHP 5.1]: http://php.net/manual/en/migration51.references.php
[PHP 5.2]: http://php.net/manual/en/migration52.incompatible.php
[PHP 5.3]: http://php.net/manual/en/migration53.incompatible.php
[PHP 5.4]: http://php.net/manual/en/migration54.incompatible.php
[PHP 5.5]: http://php.net/manual/en/migration55.incompatible.php
[PHP 5.6]: http://php.net/manual/en/migration56.incompatible.php

