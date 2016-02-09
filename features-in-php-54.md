## New features in PHP 5.4.0 (2012)

* Support for [traits](http://php.net/manual/language.oop5.traits.php) has been added.
* Short array syntax has been added, e.g. `$a = [1, 2, 3, 4];` or `$a = ['one' => 1, 'two' => 2, 'three' => 3, 'four' => 4];`.
* Function array dereferencing has been added, e.g. `foo()[0]`.
* [Closures](http://php.net/manual/functions.anonymous.php) now support `$this`.
* `<?=` is now always available, regardless of the [short_open_tag](http://php.net/manual/ini.core.php#ini.short-open-tag) <var>php.ini</var> option.
* Class member access on instantiation has been added, e.g. `(new Foo)->bar()`.
* `Class::{expr}()` syntax is now supported.
* Binary number format has been added, e.g. `0b001001101`.
* Improved parse error messages and improved incompatible arguments warnings.
* The session extension can now track the [upload progress](http://php.net/manual/session.upload-progress.php) of files.
* Built-in development [web server in CLI mode](http://php.net/manual/features.commandline.webserver.php).
* [`callable`](http://php.net/manual/language.types.callable.php) was implemented as a typehint/type declaration.
