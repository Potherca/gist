<?php
/**
 * @author Potherca <potherca@gmail.com>
 * @license GPLv3+
 * @copyright 2016 Potherca
 * @version 0.2.0
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
    $pattern = '/{{{\s?(?P<HTML_RAW>[a-zA-Z\-\_\.]+)\s?}}}|{{\s?(?P<HTML_ENCODE>[a-zA-Z\-\_\.]+)\s?}}/m';

    return preg_replace_callback($pattern, function (array $matches) use ($context) {
        if ($matches['HTML_RAW'] !== '') {
            $encode = false;
            $key = $matches['HTML_RAW'];
        } elseif ($matches['HTML_ENCODE'] !== '') {
            $encode = true;
            $key = $matches['HTML_ENCODE'];
        } else {
            throw new \UnexpectedValueException('Unknown tag type in template.');
        }

        $result = $key;

        if (array_key_exists($key, $context)) {
            $result = $context[$key];

            if (isset($encode) && (bool) $encode === true) {
                $result = htmlentities($result, ENT_HTML5 | ENT_QUOTES);
            }
        }
        return $result;
    }, $template);
}

/*EOF*/