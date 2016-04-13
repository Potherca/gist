<?php
/**
 * @author Potherca <potherca@gmail.com>
 * @license GPLv3+
 * @copyright 2016 Potherca
 * @version 0.1.0
 * @see https://gist.github.com/Potherca/94c0ba1449a2ee57aafddf961f3ebe5d/
 */

/**
 * @param string $template
 * @param array $context
 *
 * @return string
 */
function mustache($template, array $context = [])
{
    return preg_replace_callback('/{{\s?([a-zA-Z\-\_\.]+)\s?}}/m', function (array $matches) use ($context) {
        $result = $matches[1];
        if (array_key_exists($result, $context)) {
            $result = $context[$result];
        }
        return $result;
    }, $template);
}

/*EOF*/