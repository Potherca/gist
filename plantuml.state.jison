/* description: PlantUML State Diagram Grammar
 * 
 * The format of the definition is:
 *
 *     FROM --> TO : TRANSITION
 * 
 * Where [*] has special meaning as start/stop
 *
 * Example:
 *
 *     [*] -> State1
 *     State1 --> State2 : Succeeded
 *     State1 --> [*] : Aborted
 *
 * For full syntax definition see:
 */

%{
if (!('regions' in yy)) {
    yy.regions = [];
}
%}

/* lexical grammar */
%lex

%%

(\r?\n)+\s*         return 'NEWLINE';
[^\S\r\n]+          ; /* whitespace */
[a-zA-Z]+[a-zA-Z]?\b  return 'WORD'
":"                   return 'COLON'
"-->"                 return 'ARROW'
<<EOF>>               return 'EOF'

/lex

%start expressions

%% /* language grammar */

expressions
    : content EOF
        {
            console.log(yy.regions);
            return yy.regions; 
        }
    | EOF
        {
            console.log("empty file");
            return yy.regions; 
        }
    ;

content
    : line NEWLINE content
    | line NEWLINE
    | line
    ;

line
    : WORD ARROW WORD COLON WORD
        {
            if (!('regions' in yy)) {
                yy.regions = [];
            }

            if (! $5) {
                $5 = 'from' + $1 + 'To' + $3;
            }

            yy.regions.push({
             "name" : $5,
             "from" : $1,
             "to" : $3
          });
            console.log(yy.regions);
            return yy.regions;
        }
    ;
