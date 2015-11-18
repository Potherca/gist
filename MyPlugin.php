<?php

namespace Craft;

class MyPlugin extends BasePlugin
{
	/* ... */

	function init()
	{
		/* Class autoloading */
		\YiiBase::setPathOfAlias('MyVendor_MyPlugin', __DIR__ . '/src');
		$myClass = new MyVendor_MyPlugin\MyClass(); // works!
	}
}

/*EOF*/