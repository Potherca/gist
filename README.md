## Introduction

Working with Craft (like any other system) means that you are stuck doing things the way the system dictates or causing a lot of trouble for yourself.

One of the things where this becomes clear is when developers want to use arbitrary classes in their Craft plugins.

Usually this means people just dump the class somewhere (like in the services or model directory), bung an appropriate suffix to their classname (for instance `Service` or `Model`) so the class will get auto-loaded and [Bob's your uncle](https://en.wikipedia.org/wiki/Bob%27s_your_uncle).

Of course this has the disadvantage that your meticulously crafted SOAP client is now called `SoapClientModel`.

Besides being semantically _wrong_ this is also confusing for any developer not familiar with the project.

So I thought to myself "There has to be a better way".

## Using the framework's autoloader

At first I tried to get things to work through Composer and use the autoloaders it provides, but that felt very much like going against the grain. Craft is build on top of the YII framework (version 1, not version 2).

So I looked into how YII handles things.

The code of YII.v1 is a bit of an eyesore. Many things that are now considered a bad practice are prevelant in YII.v1.
Naming conventions are one of them. This means adhering to some standards that are _not_ [PSR-2](http://www.php-fig.org/psr/psr-2/) or [PSR-4](http://www.php-fig.org/psr/psr-4/) compliant. But it'll work none the less.

Go ahead, be a rebel. I'm sure no-one will mind, as long as it works.

## Step by step

1. Create a directory named `src` in the root directory of the plugin
2. Call `YiiBase::setPathOfAlias` in the `init` method of the plugin class with a namespace of choice.
3. Create a class in the `src` directory using the registered namespace.
4. Done.

Please be aware that folders/files _must_ match the namespace/classname capitalization. So if your class is called `Foo\bar` the filepath must be `Foo/bar.php`

Example files are included with [this gist](https://gist.github.com/potherca/2d3de34f114479b06c89/)

## Variation on a theme

Because of the way the "aliassing" works, it is not possible to add a "sub-namespace". If you have your heart set on using `MyVendor\MyPlugin` instead of the admittedly ugly `MyVendor_MyPlugin`, the `src` directory should be registered as vendor `\YiiBase::setPathOfAlias('MyVendor', __DIR__ . '/src');` and a directory needs to be created in `src` named `MyPlugin`.
