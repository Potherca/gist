 Whitespace
================================================================================

 File Encoding
--------------------------------------------------------------------------------

### File encoded uses ISO-8859-1

### File encoded uses UTF-8

 Brace Placement (Class)
--------------------------------------------------------------------------------

### Class opening/closing braces on seperate line (Allman)

    class Foo 
    {
        // ...
    }

### Class structure opening/closing braces on same line as declaration (OTBS)

    class Foo {
        // ...
    }

 Brace Placement (Control Structures)
--------------------------------------------------------------------------------

### Control structure opening/closing braces on same line as declaration (OTBS)
    if($baz) {
        // ..
    } else {
        // ..
    }    

### Control structure braces on same line as declaration, except for closing brace (Stroustrup)
    if($baz) {
        // ..
    }
    else {
        // ..
    }    

### Control structure opening/closing braces on seperate line from declaration (Allman)
    if($baz)
    {
        // ..
    } 
    else 
    {
        // ..
    }    


 Brace Placement (Methods)
--------------------------------------------------------------------------------

### Method opening/closing braces on seperate line (Allman)

    function bar($baz)
    {
        // ...
    }

### Method structure opening braces on same line as declaration (OTBS)

    function bar($baz) {
        // ...
    }


 Blank line after `<?php` opening token
--------------------------------------------------------------------------------

###  Blank line after `<?php` opening token

    <?php
    
        // The line above this comment is empty
        // ...

###  No blank line after `<?php` opening token

    <?php
        // The line above this comment is used
        // ...


 Indentation (general)
--------------------------------------------------------------------------------

### 2 Spaces for Indentation

    class Foo {
      function bar($baz) {
        // uses two spaces for indentation
      }
    }

### 4 Spaces for Indentation

    class Foo {
        function bar($baz) {
            // uses four spaces for indentation
        }
    }

### Tabs for Indentation

    class Foo {
    	function bar($baz) {
    		// uses one tab for indentation
    	}
    }

 Indentation (switch -> case)
--------------------------------------------------------------------------------

### Don`t indent 'case' from 'switch'

    switch($baz){
    case 'bar':
    // Regardless of where the `break` is
    }

### Indent 'case' one level from 'switch'

    switch($baz){
        case 'bar':
        // Regardless of where the `break` is
    }

### Indent 'case' two levels from 'switch'

    switch($baz){
            case 'bar':
            // Regardless of where the `break` is
    }


 Indentation (switch -> break)
--------------------------------------------------------------------------------

### Don`t indent 'break' from 'switch'

    switch($baz){
    // Regardless of where the `case` is
    break;
    }
    
### Indent 'break' one level from 'switch'

    switch($baz){
        // Regardless of where the `case` is
        break;
    }

### Indent 'break' two levels from 'switch'

    switch($baz){
            // Regardless of where the `case` is
            break;
    }

 Line Endings
--------------------------------------------------------------------------------

### Mac Style Line Ending (CR)

    echo 'foo';
    // ...
    
### Windows Style Line Ending (CRLF)

    echo 'foo';
    // ...

### UNIX Style Line Ending (LF)

    echo 'foo';
    // ...

 
 Space Around Control Structure Evaluation Block
--------------------------------------------------------------------------------

###  Space around control structure Evaluation block

    if ($baz) {
        // ...
    }

###  No space around control structure Evaluation block

    if($baz){
        // ...
    }

 Space Inside Control Structure Evaluation Block
--------------------------------------------------------------------------------

###  Space inside control structure Evaluation block

    if ( $baz ) {
        // ...
    }

###  No space inside control structure Evaluation block

    if($baz) {
        // ...
    }


 Space Around Method Declaration Param Block
--------------------------------------------------------------------------------

###  Space around parameter declaration block

    function bar ($baz) {
        // ...
    }

###  No space around parameter declaration block
    
    function bar($baz){
        // ...
    }


 Space Inside Method Declaration Param Block
--------------------------------------------------------------------------------

###  Space inside parameter declaration block

    function bar( $baz ){
        // ...
    }

###  No space inside parameter declaration block
    
    function bar($baz){
        // ...
    }



 Naming Convention
================================================================================

 Class Names
--------------------------------------------------------------------------------

### Class Name in camelCase

    class fooBarBaz {
        // ...
    }

### Class Name in PascalCase

    class FooBarBaz {
        // ...
    }

### Class Name in CAPS_SNAKE_CASE

    class FOO_BAR_BAZ {
        // ...
    }

### Class Name in Snake_Pascal_Case

    class Foo_Bar_Baz {
        // ...
    }

### Class Name in snake_case

    class foo_bar_baz {
        // ...
    }

### Class Snake_first_letter_uppercase

    class Foo_bar_baz {
        // ...
    }

 Class Constant Names
--------------------------------------------------------------------------------

### Class Constant Name in camelCase

    class Foo {
        const barBaz = 0;
    }
    
### Class Constant Name in PascalCase

    class Foo {
        const BarBaz = 0;
    }
    
### Class Constant Name in CAPS_SNAKE_CASE

    class Foo {
        const BAR_BAZ = 0;
    }
    
### Class Constant Name in Snake_Pascal_Case

    class Foo {
        const Bar_Baz = 0;
    }
    
### Class Constant Name in snake_case

    class Foo {
        const bar_baz = 0;
    }
    
 Class Method Names
--------------------------------------------------------------------------------

### Class Method Name in camelCase

    class Foo {
        public function barBaz(){
            // ...
        }
    }
    
### Class Method Name in PascalCase

    class Foo {
        public function BarBaz(){
            // ...
        }
    }
    
### Class Method Name in CAPS_SNAKE_CASE

    class Foo {
        public function BAR_BAZ(){
            // ...
        }
    }
    
### Class Method Name in Snake_Pascal_Case

    class Foo {
        public function Bar_Baz(){
            // ...
        }
    }
    
### Class Method Name in snake_case

    class Foo {
        public function bar_baz(){
            // ...
        }
    }
    
 Class Variable Names
--------------------------------------------------------------------------------

### Class Variable Name in camelCase

    class Foo {
        protected $barBaz;
    }
    
### Class Variable Name in PascalCase

    class Foo {
        protected $BarBaz;
    }
    
### Class Variable Name in CAPS_SNAKE_CASE

    class Foo {
        protected $BAR_BAZ;
    }
    
### Class Variable Name in Snake_Pascal_Case

    class Foo {
        protected $Bar_Baz;
    }
    
### Class Variable Name in snake_case

    class Foo {
        protected $bar_baz;
    }
    
 Constant Names
--------------------------------------------------------------------------------

### Constant Name in camelCase

    define('barBaz', 0);

### Constant Name in PascalCase

    define('BarBaz', 0);

### Constant Name in CAPS_SNAKE_CASE

    define('BAR_BAZ', 0);

### Constant Name in Snake_Pascal_Case

    define('Bar_Baz', 0);

### Constant Name in snake_case

    define('bar_baz', 0);

 Function Names
--------------------------------------------------------------------------------

### Function Name in camelCase

    function barBaz(){
        // ...
    }
    
### Function Name in PascalCase

    function BarBaz(){
        // ...
    }
    
### Function Name in CAPS_SNAKE_CASE

    function BAR_BAZ(){
        // ...
    }
    
### Function Name in Snake_Pascal_Case

    function Bar_Baz(){
        // ...
    }
    
### Function Name in snake_case

    function bar_baz(){
        // ...
    }
    


 Namespace Usage
--------------------------------------------------------------------------------

### Use Namespace

    namespace Vendor\Package {
        class Foo {
            // ...
        }
    }

### Prefix Class Name instead of using Namespace

    class Vendor_Package_Foo {
        // ...
    }


 PHP Constants Casing
--------------------------------------------------------------------------------
### PHP Constants LowerCase 
    
    $baz = true;
    $baz = false;
    $baz = null;
    
### PHP Constants UpperCase 
    
    $baz = TRUE;
    $baz = FALSE;
    $baz = NULL;

 PHP Keyword Casing
--------------------------------------------------------------------------------
### PHP Keywords LowerCase 
    
    try {
        if(){
            switch(){
                // ...
            }
        }
    } catch (){
        // ...
    }

### PHP Keywords UpperCase

    TRY {
        IF(){
            SWITCH(){
                // ...
            }
        }
    } CATCH (){
        // ...
    }

 Other
================================================================================

 Method Declare Order
--------------------------------------------------------------------------------

### `static` declared after visibility

    class Foo
    {
        public static function bar($baz) 
        {
            // ...
        }
    }

### `static` declared before visibility

    class Foo
    {
        static public function bar($baz) 
        {
            // ...
        }
    }

### `abstract` (or `final`) declared after visibility

    class Foo
    {
        public abstract function bar($baz);
        // ...
    }

### `abstract` (or `final`) declared before visibility

    class Foo
    {
        abstract public function bar($baz);
        // ...
    }


 Dockblocks
--------------------------------------------------------------------------------

### Docblocks manditory

    /**
     * The Foo Class
     *
     * Takes care of all of the foos
     */
    class Foo {
        /**
         * Bar a given Baz
         * 
         * @param $baz
         * 
         * @return bool
         */
        function bar($baz) {
            // ...
        }
    }

### Docblocks optional

    class Foo {
        function bar($baz) {
            // ...
        }
    }

 Closing Tags
--------------------------------------------------------------------------------

### Closing tag `?>` allowed or manditory

    <?php
        // ...
    ?>
    
### Closing tag `?>` not allowed

    <?php
        // ...
    #EOF


 Short Tags (general)
--------------------------------------------------------------------------------

### Short tag '<?' allowed

    <p>
        <? echo $baz ?>
    </p>

### Short tag '<?' not allowed

    <p>
        <?php echo $baz ?>
    </p>


 Short Tags (echo)
--------------------------------------------------------------------------------

### Short echo tag '<?=' allowed

    <p>
        <?= $baz ?>
    <p>

### Short echo tag '<?=' not allowed

    <p>
        <? echo $baz ?>
    </p>



 Always use control braces
--------------------------------------------------------------------------------

###  Control braces mandatory

    if($baz) {
        // ..
    } else {
        // ..
    }    

###  Control braces optional

    if($baz)
        // ..
    else
        // ..

        
 Castaways and Cutouts
================================================================================

 Linelength
--------------------------------------------------------------------------------

### Limit on 80 characters

    // Break before hitting the 80 character line
    //----------------------------------40-↓------------------------------------80-↓-----------------------------------120-↓-----------------------------------160-↓-----------------------------------200-↓-----------------------------------[∞]-→
    $iterator = new RecursiveDirectoryIterator(
          $folder, FilesystemIterator::CURRENT_AS_FILEINFO 
        | FilesystemIterator::KEY_AS_PATHNAME 
        | FilesystemIterator::FOLLOW_SYMLINKS | FilesystemIterator::SKIP_DOTS 
        | FilesystemIterator::UNIX_PATHS
    );

### Limit on 100 characters

    // Break before hitting the 100 character line
    //----------------------------------40-↓------------------------------------80-↓-----------------------------------120-↓-----------------------------------160-↓-----------------------------------200-↓-----------------------------------[∞]-→
    $iterator = new RecursiveDirectoryIterator(
          $folder, FilesystemIterator::CURRENT_AS_FILEINFO | FilesystemIterator::KEY_AS_PATHNAME 
        | FilesystemIterator::FOLLOW_SYMLINKS | FilesystemIterator::SKIP_DOTS 
        | FilesystemIterator::UNIX_PATHS
    );


### Limit on 120 characters

    // Break before hitting the 120 character line
    //----------------------------------40-↓------------------------------------80-↓-----------------------------------120-↓-----------------------------------160-↓-----------------------------------200-↓-----------------------------------[∞]-→
    $iterator = new RecursiveDirectoryIterator(
          $folder, FilesystemIterator::CURRENT_AS_FILEINFO | FilesystemIterator::KEY_AS_PATHNAME 
        | FilesystemIterator::FOLLOW_SYMLINKS | FilesystemIterator::SKIP_DOTS | FilesystemIterator::UNIX_PATHS
    );

### No limit on line length

    // I Break for no-one!
    //----------------------------------40-↓------------------------------------80-↓-----------------------------------120-↓-----------------------------------160-↓-----------------------------------200-↓-----------------------------------[∞]-→
    $iterator = new RecursiveDirectoryIterator($folder, FilesystemIterator::CURRENT_AS_FILEINFO | FilesystemIterator::KEY_AS_PATHNAME | FilesystemIterator::FOLLOW_SYMLINKS | FilesystemIterator::SKIP_DOTS | FilesystemIterator::UNIX_PATHS);


Operators and assignment (Yoda Conditions/Left Side Comparison)
--------------------------------------------------------------------------------

### Normal comparison

    if($baz === 'baz'){
        // ...
    }

### Yoda Condition/Left Side Comparison

    if('baz' === $baz){
        // ...
    }

Inter-line alignment     (Vertical Lining Up Values)
--------------------------------------------------------------------------------

### Non-Aligned Values

    $baz = 'baz';
    $quux = 'qux';
    $foozle = 'foo';

### Aligned Values

    $baz    = 'baz';
    $quux   = 'qux';
    $foozle = 'foo';


Comments and documentation blocks
--------------------------------------------------------------------------------

### Perl Style Comments

    # This is a comment

### C++ Style Comments

    // This is a comment

### C Style Comments

    /* This is a comment */



Usage of underscore '_' for private/protected properties
--------------------------------------------------------------------------------

### Does not use underscore '_' for private/protected properties

    class Foo {
        protected function bar($baz) {
            // ...
        }
    }


### Uses underscore '_' for private/protected properties

    class Foo {
        protected function _bar($baz) {
            // ...
        }
    }

<!-- EOF -->
