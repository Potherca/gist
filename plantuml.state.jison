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
    : content NEWLINE expressions
    | content expressions
    | EOF {return yy.results || [];}
;

content
    : WORD ARROW WORD COLON WORD {
            if (!('results' in yy)) {yy.results = [];}
            yy.results.push({
                "name" : $5,
                "from" : $1,
                "to" : $3
            });
    }
;