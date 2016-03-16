## Introduction

Sometimes you want to be able to debug a bash script. Usually [the `-x` option](http://tldp.org/LDP/abs/html/options.html)
will suffice but sometimes something more sophisticated is needed.

In such instances using [the DEBUG trap](http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_12_02.html) is often a good choice.

Attached to this gist is a example script to demonstrate how such a thing would
work.

To easily demonstrate it's working, the `DEBUG_LEVEL` has been set as a parameter
In real live situations it would more likely be set as an environmental variable
rather than passed in as a parameter.

## Example output

Below is the output of the script when the script is run with various debug levels:

### Debug Level 0 (the default)

     $ bash /path/to/debug-example.sh World
    # Hello World!
    # Done.

### Debug Level 1

     $ bash /path/to/debug-example.sh World 1
    # Debugging on - Debug Level : 1
    # Hello World!
    # Done.

### Debug Level 2

     $ bash /path/to/debug-example.sh World 2
    #[DEBUG] [debug-example.sh:179] [ ${g_iExitCode} -eq 0 ]
    #[DEBUG] [debug-example.sh:181] run ${@:-}
    # Debugging on - Debug Level : 2
    # Hello World!
    #[DEBUG] [debug-example.sh:183] [ ${#g_aErrorMessages[*]} -ne 0 ]
    #[DEBUG] [debug-example.sh:186] message 'Done.'
    # Done.
    #[DEBUG] [debug-example.sh:192] echo -e "# ${@}" 1>&1

### Debug Level 3

     $ bash /path/to/debug-example.sh World 3
    + declare -a g_aErrorMessages
    + declare -i g_iExitCode=0
    + declare -i g_iErrorCount=0
    + registerTraps
    + trap finish EXIT
    + '[' 3 -gt 1 ']'
    + '[' 3 -lt 5 ']'
    + trap '(debugTrapMessage "$(basename ${BASH_SOURCE[0]})" "${LINENO[0]}" "${BASH_COMMAND}");' DEBUG
    +++ basename /path/to/debug-example.sh
    ++ debugTrapMessage debug-example.sh 179 '[ ${g_iExitCode} -eq 0 ]'
    ++ debug '[debug-example.sh:179] [ ${g_iExitCode} -eq 0 ]'
    ++ echo -e '#[DEBUG] [debug-example.sh:179] [ ${g_iExitCode} -eq 0 ]'
    #[DEBUG] [debug-example.sh:179] [ ${g_iExitCode} -eq 0 ]
    + '[' 0 -eq 0 ']'
    +++ basename /path/to/debug-example.sh
    ++ debugTrapMessage debug-example.sh 181 'run ${@:-}'
    ++ debug '[debug-example.sh:181] run ${@:-}'
    ++ echo -e '#[DEBUG] [debug-example.sh:181] run ${@:-}'
    #[DEBUG] [debug-example.sh:181] run ${@:-}
    + run World 3
    + '[' 3 -gt 0 ']'
    + message 'Debugging on - Debug Level : 3'
    + echo -e '# Debugging on - Debug Level : 3'
    # Debugging on - Debug Level : 3
    + '[' 2 -ne 1 ']'
    + '[' 2 -ne 2 ']'
    + message 'Hello World!'
    + echo -e '# Hello World!'
    # Hello World!
    +++ basename /path/to/debug-example.sh
    ++ debugTrapMessage debug-example.sh 183 '[ ${#g_aErrorMessages[*]} -ne 0 ]'
    ++ debug '[debug-example.sh:183] [ ${#g_aErrorMessages[*]} -ne 0 ]'
    ++ echo -e '#[DEBUG] [debug-example.sh:183] [ ${#g_aErrorMessages[*]} -ne 0 ]'
    #[DEBUG] [debug-example.sh:183] [ ${#g_aErrorMessages[*]} -ne 0 ]
    + '[' 0 -ne 0 ']'
    +++ basename /path/to/debug-example.sh
    ++ debugTrapMessage debug-example.sh 186 'message '\''Done.'\'''
    ++ debug '[debug-example.sh:186] message '\''Done.'\'''
    ++ echo -e '#[DEBUG] [debug-example.sh:186] message '\''Done.'\'''
    #[DEBUG] [debug-example.sh:186] message 'Done.'
    + message Done.
    + echo -e '# Done.'
    # Done.
    +++ basename /path/to/debug-example.sh
    ++ debugTrapMessage debug-example.sh 192 'echo -e "# ${@}" 1>&1'
    ++ debug '[debug-example.sh:192] echo -e "# ${@}" 1>&1'
    ++ echo -e '#[DEBUG] [debug-example.sh:192] echo -e "# ${@}" 1>&1'
    #[DEBUG] [debug-example.sh:192] echo -e "# ${@}" 1>&1
    + finish
    + '[' '!' 0 -eq 0 ']'
    + exit 0

### Debug Level 4

     $ bash /path/to/debug-example.sh World 4
    + declare -a g_aErrorMessages
    + declare -i g_iExitCode=0
    + declare -i g_iErrorCount=0
    + registerTraps
    + trap finish EXIT
    + '[' 4 -gt 1 ']'
    + '[' 4 -lt 5 ']'
    + trap '(debugTrapMessage "$(basename ${BASH_SOURCE[0]})" "${LINENO[0]}" "${BASH_COMMAND}");' DEBUG
    +++ basename /path/to/debug-example.sh
    ++ debugTrapMessage debug-example.sh 179 '[ ${g_iExitCode} -eq 0 ]'
    ++ debug '[debug-example.sh:179] [ ${g_iExitCode} -eq 0 ]'
    ++ echo -e '#[DEBUG] [debug-example.sh:179] [ ${g_iExitCode} -eq 0 ]'
    #[DEBUG] [debug-example.sh:179] [ ${g_iExitCode} -eq 0 ]
    + '[' 0 -eq 0 ']'
    +++ basename /path/to/debug-example.sh
    ++ debugTrapMessage debug-example.sh 181 'run ${@:-}'
    ++ debug '[debug-example.sh:181] run ${@:-}'
    ++ echo -e '#[DEBUG] [debug-example.sh:181] run ${@:-}'
    #[DEBUG] [debug-example.sh:181] run ${@:-}
    + run World 4
    + '[' 4 -gt 0 ']'
    + message 'Debugging on - Debug Level : 4'
    + echo -e '# Debugging on - Debug Level : 4'
    # Debugging on - Debug Level : 4
    + '[' 2 -ne 1 ']'
    + '[' 2 -ne 2 ']'
    + message 'Hello World!'
    + echo -e '# Hello World!'
    # Hello World!
    +++ basename /path/to/debug-example.sh
    ++ debugTrapMessage debug-example.sh 183 '[ ${#g_aErrorMessages[*]} -ne 0 ]'
    ++ debug '[debug-example.sh:183] [ ${#g_aErrorMessages[*]} -ne 0 ]'
    ++ echo -e '#[DEBUG] [debug-example.sh:183] [ ${#g_aErrorMessages[*]} -ne 0 ]'
    #[DEBUG] [debug-example.sh:183] [ ${#g_aErrorMessages[*]} -ne 0 ]
    + '[' 0 -ne 0 ']'
    +++ basename /path/to/debug-example.sh
    ++ debugTrapMessage debug-example.sh 186 'message '\''Done.'\'''
    ++ debug '[debug-example.sh:186] message '\''Done.'\'''
    ++ echo -e '#[DEBUG] [debug-example.sh:186] message '\''Done.'\'''
    #[DEBUG] [debug-example.sh:186] message 'Done.'
    + message Done.
    + echo -e '# Done.'
    # Done.
    +++ basename /path/to/debug-example.sh
    ++ debugTrapMessage debug-example.sh 192 'echo -e "# ${@}" 1>&1'
    ++ debug '[debug-example.sh:192] echo -e "# ${@}" 1>&1'
    ++ echo -e '#[DEBUG] [debug-example.sh:192] echo -e "# ${@}" 1>&1'
    #[DEBUG] [debug-example.sh:192] echo -e "# ${@}" 1>&1
    + finish
    + '[' '!' 0 -eq 0 ']'
    + exit 0

### Debug Level 5

     $ bash /path/to/debug-example.sh World 5
    + declare -a g_aErrorMessages
    + declare -i g_iExitCode=0
    + declare -i g_iErrorCount=0
    + registerTraps
    + trap finish EXIT
    + '[' 5 -gt 1 ']'
    + '[' 5 -lt 5 ']'
    + '[' 0 -eq 0 ']'
    + run World 5
    + '[' 5 -gt 0 ']'
    + message 'Debugging on - Debug Level : 5'
    + echo -e '# Debugging on - Debug Level : 5'
    # Debugging on - Debug Level : 5
    + '[' 2 -ne 1 ']'
    + '[' 2 -ne 2 ']'
    + message 'Hello World!'
    + echo -e '# Hello World!'
    # Hello World!
    + '[' 0 -ne 0 ']'
    + message Done.
    + echo -e '# Done.'
    # Done.
    + finish
    + '[' '!' 0 -eq 0 ']'
    + exit 0

