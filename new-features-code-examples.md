## Code Examples

1. Dynamic access to static methods

        <?php
        class C {
           public static $foo = 123;
        }

        $a = "C";
        echo $a::$foo;
        ?>
    The above example will output:

        123

2. Nested Exceptions

        <?php
        class MyCustomException extends Exception {}

        try {
            throw new MyCustomException("Exceptional", 112);
        } catch (Exception $e) {
            /* Note the use of the third parameter to pass $e
             * into the RuntimeException. */
            throw new RuntimeException("Rethrowing", 911, $e);
        }
        ?>
