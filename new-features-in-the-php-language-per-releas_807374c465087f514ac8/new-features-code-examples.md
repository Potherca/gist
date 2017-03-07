## Code Examples

### PHP 5.3

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

### PHP 5.5

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

### PHP 5.6

8. Constant Expressions Example


    <?php
    const ONE = 1;
    const TWO = ONE * 2;
        
    class C {
        const THREE = TWO + 1;
        const ONE_THIRD = ONE / self::THREE;
        const SENTENCE = 'The value of THREE is '.self::THREE;
        
        public function f($a = ONE + self::THREE) {
            return $a;
        }
    }
        
    echo (new C)->f()."\n";
    echo C::SENTENCE;
    ?>

The above example will output:

    4
    The value of THREE is 3

9. Constant Array Example


    <?php
    const ARR = ['a', 'b'];
        
    echo ARR[0];
    ?>

The above example will output:

    a

10. Variadic Functions Example


    <?php
    function f($req, $opt = null, ...$params) {
        // $params is an array containing the remaining arguments.
        printf('$req: %d; $opt: %d; number of params: %d'."\n",
               $req, $opt, count($params));
    }
        
    f(1);
    f(1, 2);
    f(1, 2, 3);
    f(1, 2, 3, 4);
    f(1, 2, 3, 4, 5);
    ?>

The above example will output:

    $req: 1; $opt: 0; number of params: 0
    $req: 1; $opt: 2; number of params: 0
    $req: 1; $opt: 2; number of params: 1
    $req: 1; $opt: 2; number of params: 2
    $req: 1; $opt: 2; number of params: 3

11. Argument Unpacking Example


    <?php
    function add($a, $b, $c) {
        return $a + $b + $c;
    }
        
    $operators = [2, 3];
    echo add(1, ...$operators);
    ?>

The above example will output:

    6
    
12. Exponentiation Example


    <?php
    printf("2 ** 3 ==      %d\n", 2 ** 3);
    printf("2 ** 3 ** 2 == %d\n", 2 ** 3 ** 2);
        
    $a = 2;
    $a **= 3;
    printf("a ==           %d\n", $a);
    ?>

The above example will output:

    2 ** 3 ==      8
    2 ** 3 ** 2 == 512
    a ==           8


13. `use function` and `use const` Example


    <?php
    namespace Name\Space {
        const FOO = 42;
        function f() { echo __FUNCTION__."\n"; }
    }
        
    namespace {
        use const Name\Space\FOO;
        use function Name\Space\f;
        
        echo FOO."\n";
        f();
    }
    ?>

The above example will output:

    42
    Name\Space\f

14. GMP Overloading Example


    <?php
    $a = gmp_init(42);
    $b = gmp_init(17);
        
    // Pre-5.6 code:
    var_dump(gmp_add($a, $b));
    var_dump(gmp_add($a, 17));
    var_dump(gmp_add(42, $b));
        
    // New code:
    var_dump($a + $b);
    var_dump($a + 17);
    var_dump(42 + $b);
    ?>
    
15. `hash_equals` Example


    <?php
    $expected  = crypt('12345', '$2a$07$usesomesillystringforsalt$');
    $correct   = crypt('12345', '$2a$07$usesomesillystringforsalt$');
    $incorrect = crypt('1234',  '$2a$07$usesomesillystringforsalt$');
        
    var_dump(hash_equals($expected, $correct));
    var_dump(hash_equals($expected, $incorrect));
    ?>

The above example will output:

    bool(true)
    bool(false)

16. `__debugInfo()` Example


    <?php
    class C {
        private $prop;
            
        public function __construct($val) {
            $this->prop = $val;
        }
        
        public function __debugInfo() {
            return [
                'propSquared' => $this->prop ** 2,
            ];
        }
    }
        
    var_dump(new C(42));
    ?>

The above example will output:

    object(C)#1 (1) {
      ["propSquared"]=>
      int(1764)
    }

17. 
