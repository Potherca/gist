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

3. A simple example that reimplements the [range()](http://php.net/manual/function.range.php) function as a generator (at least for positive _step_ values)

        <?php  
        function xrange($start, $limit, $step = 1) {  
            for ($i = $start; $i <= $limit; $i += $step) {  
                yield $i;  
            }  
        }  

        echo 'Single digit odd numbers: ';  

        /*  
         * Note that an array is never created or returned,  
         * which saves memory.  
         */  
        foreach (xrange(1, 9, 2) as $number) {  
            echo "$number ";  
        }  

        echo "\n";  
        ?>

    The above example will output:

        Single digit odd numbers: 1 3 5 7 9

4. Foreach list example:

        <?php  
        $array = [  
            [1, 2],  
            [3, 4],  
        ];  

        foreach ($array as list($a, $b)) {  
            echo "A: $a; B: $b\n";  
        }  
        ?>

    The above example will output:

        A: 1; B: 2
        A: 3; B: 4

    Further documentation is available on the [foreach](http://php.net/manual/control-structures.foreach.php#control-structures.foreach.list) manual page.
5. Empty expression example:

        <?php  
        function always_false() {  
            return false;  
        }  

        if (empty(always_false())) {  
            echo "This will be printed.\n";  
        }  

        if (empty(true)) {  
            echo "This will not be printed.\n";  
        }  
        ?>

    The above example will output:

        This will be printed.

6. Array and string literal dereferencing example:
        <?php  
        echo 'Array dereferencing: ';  
        echo [1, 2, 3][0];  
        echo "\n";  

        echo 'String dereferencing: ';  
        echo 'PHP'[0];  
        echo "\n";  
        ?>

    The above example will output:

        Array dereferencing: 1
        String dereferencing: P

7. `ClassName::class` example:

        <?php  
        namespace Name\Space;  
        class ClassName {}  

        echo ClassName::class;  

        echo "\n";  
        ?>

    The above example will output:

        Name\Space\ClassName
