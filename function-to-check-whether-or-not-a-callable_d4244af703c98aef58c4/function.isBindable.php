<?php

namespace PhpHooligans;

/**
 * 
 * @param \Closure $callable
 *
 * @return bool
 */
function isBindable(\Closure $callable)
{
    $bindable = false;

    $reflectionFunction = new \ReflectionFunction($callable);
    if (
        $reflectionFunction->getClosureScopeClass() === null
        || $reflectionFunction->getClosureThis() !== null
    ) {
        $bindable = true;
    }

    return $bindable;
}

/*EOF*/
