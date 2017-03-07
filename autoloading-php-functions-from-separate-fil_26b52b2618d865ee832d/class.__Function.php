<?php

/**
 * Provides __autoloading for functions placed in FUNCTION_DIR.
 *
 * This also allows for easy function aliassing in case of namespace conflicts.
 * There are two requisites for this to work:
 *
 *  1. a constant named FUNCTION_DIR must be defined to point to the directory
 *    where you keep your functions
 *  2. Each file containing a function must adhere to the following naming
 *     convention: function.name.php
 *
 * I still have to benchmark the difference between dumping everything in one
 * big-old file vs. putting everything in their own file and having more I/O
 * overhead, but from a maintainability viewpoint it's already a very big bonus.
 *
 * Usage Example:
 * $_SERVER['Function'] = new __Function;
 * $_SERVER['Function']->Hello('World');
 *
 * Please note that although you can call PHP's internal function, calling a
 * language construct will trigger a warning. (array, die, echo, empty, eval,
 * exit, include, include_once, isset, list, print, require, require_once,
 * return, unset)
 *
 * @todo set up an array for function aliases
 * @todo replace the use of FUNCTION_DIR with an array, for extendability (to support more than ONE location to load functions from)
 * @todo set up a (dynamic) filename guessing scheme? Or just use `strpos($sFile, $sFunctionName) !== false`?
 *
 * @package    [Potherca]
 * @subpackage Tools-and-Utillities
 * @version    2009.2.7
 * @author     Potherca <potherca@gmail.com>
 * @license    GPL-3.0+
 *             https://spdx.org/licenses/GPL-3.0.html
 * @copyright  2009
 *
 * Note: The variable naming scheme used in this code is an adaption of 
 * Systems Hungarian which is explained at http://pother.ca/VariableNamingConvention/
 */
class __Function
{
    public function __call($p_sFunctionName, $aParameters = null)
    {
        self::__callStatic($p_sFunctionName, $aParameters);
    }

    public function __callStatic($p_sFunctionName, $aParameters = null)
    {
        if (!is_string($p_sFunctionName)) {
            trigger_error(__FUNCTION__ . ' first parameter should be a string.');
        } else {
            $sFunction = $p_sFunctionName;
            if (!function_exists($sFunction)) {
                // only load function-file if it is not already included
                $sFunctionFile = FUNCTION_DIR . 'function.' . $sFunction . '.php';
                if (!is_readable($sFunctionFile)) {
                    trigger_error(__FUNCTION__ . ' could not read function-file for function"' . $sFunction . '".');
                } else {
                    require_once $sFunctionFile;
                }
            }
            return call_user_func_array(
                $sFunction,
                $aParameters
            );
        }
    }
}

#EOF
