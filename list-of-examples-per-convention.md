 Whitespace
----------------------------------------------

###  Indent spaces or tabs

    function foo() {
      // uses two spaces for indentation
      return "bar";
    }

    function foo() {
        // uses four spaces for indentation
        return "bar";
    }

    function foo() {
    	// uses one tab for indentation
    	return "bar";
    }

###  Line length


    // Break before hitting the 80 character line
    $iterator = new RecursiveDirectoryIterator($folder, 
        FilesystemIterator::KEY_AS_PATHNAME 
        | FilesystemIterator::CURRENT_AS_FILEINFO 
        | FilesystemIterator::SKIP_DOTS);

    // Break before hitting the 120 character line
    $iterator = new RecursiveDirectoryIterator($folder, FilesystemIterator::KEY_AS_PATHNAME 
        | FilesystemIterator::CURRENT_AS_FILEINFO | FilesystemIterator::SKIP_DOTS);

    // I Break for no-one!
    $iterator = new RecursiveDirectoryIterator($folder, FilesystemIterator::KEY_AS_PATHNAME | FilesystemIterator::CURRENT_AS_FILEINFO | FilesystemIterator::SKIP_DOTS);

###  Line endings

    @TODO

###  Closing php tag present or not

    <?php
        echo 'php closing tag is for suckers!';
        // ...
    //EOF
    
    <?php
        echo 'You open it, you close it!';
        // ...
    ?>
    
###  Blank line after `<?php` opening token or not

    <?php
        echo 'No blank line after opening tag.';
        // ...
    ?>

    <?php
    
        echo 'Blank line after opening tag.';
        // ...
    ?>

###  Indentation of case/break from switch

    @TODO

###  Space after Function/Method declaration

    function foo(){
        return "bar";
    }

    function foo() {
        return "bar";
    }

###  Space after Class declaration

    class Foo{
        // ...    
    }

    class Foo {
        // ...    
    }

###  Space after Control declaration
    if($foo){
        // ...
    }

    if($foo) {
        // ...
    }

 Line breaks
----------------------------------------------

###  Class brace same or next line

    class Foo {
        // ...    
    }

    class Foo
    {
        // ...    
    }

###  Function/Method brace same or next line

    function foo() {
        // ...
    }

    function foo()
    {
        // ...
    }

###  Control brace same or next line and else/elseif same or next line

    if($foo) {
        // ...
    } else {
        // ...
    }

    if($foo) {
        // ...
    } 
    elseif($bar) {
        // ...
    } 
    else {
        // ...
    }
    
    if($foo) 
    {
        // ...
    } 
    elseif($bar) 
    {
        // ...
    } 
    else 
    {
        // ...
    }


 Naming Convention
----------------------------------------------

###  Class names

    @TODO

###  Function/Method names

    @TODO

###  Constant names

    @TODO

###  true/false/null lowercase or uppercase

    @TODO

 Misc. (by want of a better name)
----------------------------------------------

###  Declaration of `static` first or visibility `public`/`protected`/`private` first

    class Foo
    {
        public static function bar() 
        {
            // ...
        }
    }

    class Foo
    {
        static public function bar() 
        {
            // ...
        }
    }

###  Always use Control braces

    if($foo) {
        // ..
    }

    if($foo)
        // ..


 Castaways and Cutouts
----------------------------------------------

    @TO_NOT_DO

__EOF__
