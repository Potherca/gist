<?php

namespace Craft;

class MyPlugin extends BasePlugin
{
    /* ... */

	function init()
	{
		/* Class autoloading */
		\YiiBase::setPathOfAlias('Itmundi_Tobias', __DIR__ . '/src');
  }
}

/*EOF*/