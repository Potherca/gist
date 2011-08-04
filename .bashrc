# ------------------------------------------------------
# Enhance prompt when inside git repos
# http://railstips.org/blog/archives/2009/02/02/bedazzle-your-bash-prompt-with-git-info/
# ------------------------------------------------------
function parse_git_branch {
	ref=$(git symbolic-ref HEAD 2> /dev/null) || return
	echo -e  '\E[0;34m'"\033[1m("${ref#refs/heads/}")  \033[0m"
}

# ------------------------------------------------------
# Enhance prompt when inside SVN working directories
# 
# Inside SVN working directories this will check for updates after each time you 
# execute a command. If the response from the server is slow, this can cause 
# latency in the prompt cursor appearing. You can disable this by setting 
# CHECK_REMOTE to 0.
# ------------------------------------------------------
function get_svn_revision {
	CHECK_REMOTE=0
	LOCAL_REVISION=$(svn info  2> /dev/null | grep Revision | cut -c11-)
	if [ -n "$LOCAL_REVISION" ]; then
	
		if [ "$CHECK_REMOTE" = "1" ]; then
			REMOTE_REVISION=$(svn info -r HEAD | grep -i "Revision" | cut -c11-)

			if [ "$LOCAL_REVISION" = "$REMOTE_REVISION"  ]; then
				echo -e  '\E[0;32m'"\033[3m($LOCAL_REVISION) \033[0m"
			else
				echo -e  '\E[0;31m'"\033[3m($LOCAL_REVISION) \033[0m"
			fi
		else
				echo -e  '\E[0;34m'"\033[3m($LOCAL_REVISION) \033[0m"
		fi
	fi

}

PS1="$PS1\$(get_svn_revision)\$(parse_git_branch)\$ "
