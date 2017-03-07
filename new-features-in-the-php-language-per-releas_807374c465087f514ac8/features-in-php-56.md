## New features in PHP 5.6 (2014)

### Constant expressions

It is now possible to provide a scalar expression involving numeric and string literals and/or constants in contexts where PHP previously expected a static value, such as constant and property declarations and default function arguments.<sup>8</sup>

It is also now possible to define a constant [array](http://php.net/manual/language.types.array.php) using the `const` keyword.<sup>9</sup>


### Variadic functions via `...`

[Variadic functions](http://php.net/manual/functions.arguments.php#functions.variable-arg-list) can now be implemented using the `...` operator, instead of relying on [func_get_args()](http://php.net/manual/function.func-get-args.php).<sup>10</sup>


### Argument unpacking via `...`

[Arrays](http://php.net/manual/language.types.array.php) and [Traversable](http://php.net/manual/class.traversable.php) objects can be unpacked into argument lists when calling functions by using the _..._ operator. This is also known as the splat operator in other languages, including Ruby.<sup>11</sup>

### Exponentiation via `**`

A right associative `**` operator has been added to support exponentiation, along with a `**=` shorthand assignment operator.<sup>12</sup>

### `use function` and `use const`

The [`use`](http://php.net/manual/language.namespaces.importing.php) operator has been extended to support importing functions and constants in addition to classes. This is achieved via the `use function` and `use const` constructs, respectively.<sup>13</sup>

### phpdbg

PHP now includes an interactive debugger called phpdbg implemented as a SAPI module. For more information, please visit the [» phpdbg documentation](http://phpdbg.com/docs).

### Default character encoding

[default_charset](http://php.net/manual/ini.core.php#ini.default-charset) is now used as the default character set for the [htmlentities()](http://php.net/manual/function.htmlentities.php) , [html_entity_decode()](http://php.net/manual/function.html-entity-decode.php) and [htmlspecialchars()](http://php.net/manual/function.htmlspecialchars.php) functions. Note that if the (now deprecated) iconv and mbstring encoding settings are set, they will take precedence over default_charset for iconv and mbstring functions, respectively.

The default value for this setting is `UTF-8`.

### [`php://input`](http://php.net/manual/wrappers.php.php#wrappers.php.input) is reusable

[1php://input`](http://php.net/manual/wrappers.php.php#wrappers.php.input) may now be reopened and read as many times as required. This work has also resulted in a major reduction in the amount of memory required to deal with POST data.

### Large file uploads

Files larger than 2 gigabytes in size are now accepted.

### [GMP](http://php.net/manual/book.gmp.php) supports operator overloading

[GMP](http://php.net/manual/book.gmp.php) objects now support operator overloading and casting to scalar types. This allows for more expressive code using GMP.<sup>14</sup>

### [hash_equals()](http://php.net/manual/function.hash-equals.php) for timing attack safe string comparison

The [hash_equals()](http://php.net/manual/function.hash-equals.php) function has been added to compare two strings in constant time. This should be used to mitigate timing attacks; for instance, when testing [crypt()](http://php.net/manual/function.crypt.php) password hashes (assuming that you are unable to use [password_hash()](http://php.net/manual/function.password-hash.php) and [password_verify()](http://php.net/manual/function.password-verify.php) , which aren't susceptible to timing attacks).<sup>15</sup>


### `__debugInfo()`

The [__debugInfo()](http://php.net/manual/language.oop5.magic.php#language.oop5.magic.debuginfo) magic method has been added to allow objects to change the properties and values that are shown when the object is output using [var_dump()](http://php.net/manual/function.var-dump.php) .<sup>16</sup>


### gost-crypto hash algorithm

The _gost-crypto_ hash algorithm has been added. This implements the GOST hash function using the CryptoPro S-box tables as specified by [» RFC 4357, section 11.2](http://www.faqs.org/rfcs/rfc4357).

### SSL/TLS improvements

A wide range of improvements have been made to the SSL/TLS support in PHP 5.6. These include [enabling peer verification by default](http://php.net/manual/migration56.incompatible.php#migration56.incompatible.peer-verification), supporting certificate fingerprint matching, mitigating against TLS renegotiation attacks, and many new [SSL context options](http://php.net/manual/context.ssl.php) to allow more fine grained control over protocol and verification settings when using encrypted streams.

These changes are described in more detail in the [OpenSSL changes in PHP 5.6.x](http://php.net/manual/migration56.openssl.php) section of this migration guide.

### [pgsql](http://php.net/manual/book.pgsql.php) async support

The [pgsql](http://php.net/manual/book.pgsql.php) extension now supports asynchronous connections and queries, thereby enabling non-blocking behaviour when interacting with PostgreSQL databases. Asynchronous connections may be established via the **PGSQL_CONNECT_ASYNC** constant, and the new [pg_connect_poll()](http://php.net/manual/function.pg-connect-poll.php) , [pg_socket()](http://php.net/manual/function.pg-socket.php) , [pg_consume_input()](http://php.net/manual/function.pg-consume-input.php) and [pg_flush()](http://php.net/manual/function.pg-flush.php) functions may be used to handle asynchronous connections and queries.