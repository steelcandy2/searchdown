# -*- eval: (read-only-mode 1) -*-
# Aliases and functions related to my searchdown program.
#
# Note: this file is intended to be sourced - directly or indirectly - from
# .bash_profile. Selected aliases and functions can be removed using the
# 'unalias' and 'unset -f' shell builtins, respectively.
#
# Note: this file assumes that common-aliases.sh has been sourced before it
# was (since it uses some of the utility functions defined in that file).
#
# Copyright (C) 2015-2022 by James MacKay.
#
#-This program is free software: you can redistribute it and/or modify
#-it under the terms of the GNU General Public License as published by
#-the Free Software Foundation, either version 3 of the License, or
#-(at your option) any later version.
#
#-This program is distributed in the hope that it will be useful,
#-but WITHOUT ANY WARRANTY; without even the implied warranty of
#-MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#-GNU General Public License for more details.
#
#-You should have received a copy of the GNU General Public License
#-along with this program.  If not, see <https://www.gnu.org/licenses/>.
#


# Note: pagers - or at least the 'less' pager - only page output iff it's
# being sent to the terminal. So most of the following functions always pass
# searchdown's output through $PAGER (since we pretty much never want the
# first results to just go scrolling off the top of the screen).


###
### Aliases.
###

# Long aliases.
#
# Please keep these in caseless alphabetical order by alias name so that
# they can be more easily found.

alias sd-files-in-dir='sd-default -tf --depth 1'
    ## Outputs all files in the current directory in sorted order.
alias sd-backup-files='sd-default -fb'
    ## Outputs all of the backup files in and under the current directory.
alias sd-depth-1-dirs='sd-dirs --depth 1'
    ## Lists the all of the directories that are exactly 1 level below the
    ## current directory.
    #
    # See also: sd-depth-1-dirs-short.
alias sd-depth-1-dirs-short="sd-depth-1-dirs | tr '\n' ' ' | sed 's_ \$_\n_'"
    ## Outputs a space-separated list of all of the directories that are
    ## exactly 1 level below the current directory.
    #
    # See also: sd-depth-1-dirs.
alias sd-depth-2-dirs='sd-dirs --depth 2'
    ## Lists all of the directories that are exactly 2 levels below the
    ## current directory.
    #
    # See also: sdd-2.
alias sd-depth-3-dirs='sd-dirs --depth 3'
    ## Lists all of the directories that are exactly 3 levels below the
    ## current directory.
    #
    # See also: sdd-3.
alias sd-depth-4-dirs='sd-dirs --depth 4'
    ## Lists all of the directories that are exactly 4 levels below the
    ## current directory.
    #
    # See also: sdd-4.
alias sd-depth-5-dirs='sd-dirs --depth 5'
    ## Lists all of the directories that are exactly 5 levels below the
    ## current directory.
    #
    # See also: sdd-5.

# List directories at most 'n' levels deep.
alias sdd-2='sd-dirs --depth 1-2'
    ## Lists all of the directories that are at most 2 levels below the
    ## current directory.
    #
    # See also: sd-depth-2-dirs.
alias sdd-3='sd-dirs --depth 1-3'
    ## Lists all of the directories that are at most 3 levels below the
    ## current directory.
    #
    # See also: sd-depth-3-dirs.
alias sdd-4='sd-dirs --depth 1-4'
    ## Lists all of the directories that are at most 4 levels below the
    ## current directory.
    #
    # See also: sd-depth-4-dirs.
alias sdd-5='sd-dirs --depth 1-5'
    ## Lists all of the directories that are at most 5 levels below the
    ## current directory.
    #
    # See also: sd-depth-5-dirs.

alias sd-dirs-unsorted='searchdown -td | "${PAGER:-less}"'
    ## Outputs all of the directories in and under the current one WITHOUT
    ## sorting them (which outputs the first ones faster if there's a LOT of
    ## them).
    #
    # See also: sd-files-unsorted, sd-symlinks-unsorted.
alias sd-files-unsorted='searchdown -tf | "${PAGER:-less}"'
    ## Outputs all of the files in and under the current one WITHOUT sorting
    ## them (which outputs the first ones faster if there's a LOT of them).
    #
    # See also: sd-dirs-unsorted, sd-symlinks-unsorted.
alias sd-symlinks-unsorted='searchdown -tl | "${PAGER:-less}'
    ## Outputs all of the symbolic links in and under the current one WITHOUT
    ## sorting them (which outputs the first ones faster if there's a LOT of
    ## them).
    #
    # See also: sd-files-unsorted, sd-dirs-unsorted.

# List regular 'source code' files with a given extension.
#
# Note: the definition of what 'source code' is is pretty flexible: pretty
# much they just have to be regular files.
#
# See also: sd-source-code().
alias sd-emacs-lisp-sources='sd-source-code el'
    ## Outputs the pathnames of all of the Emacs Lisp source files in and
    ## under the current directory.
    #
    # We assume that all Emacs Lisp source files have the file extension
    # .el.
alias sd-html-sources='sd-source-code html'  # doesn't match .htm files, etc.
    ## Outputs the pathnames of all of the HTML files in and under the
    ## current directory.
    #
    # We assume that all HTML files have the file extension .html: in
    # particular we ignore those with the .htm extension.
alias sd-java-sources='sd-source-code java'
    ## Outputs the pathnames of all of the Java source files in and under the
    ## current directory.
    #
    # We assume that all Java source files have the file extension .java.
alias sd-org-mode-sources='sd-source-code org'
    ## Outputs the pathnames of all of the org mode files in and under the
    ## current directory.
    #
    # We assume that all org mode files have the file extension .org.
alias sd-python-sources='sd-source-code py'
    ## Outputs the pathnames of all of the Python source files in and under
    ## the current directory.
    #
    # We assume that all Python source files have the file extension .py.
alias sd-text-files='sd-source-code txt'
    ## Outputs the pathnames of all of the text files in and under the
    ## current directory that have the file extension .txt.


# Short aliases.
#
# Please keep these in caseless alphabetical order by alias name so that
# they can be more easily found.
#echo "DO_DEFINE_SHORT_GROUP_ALIASES = ${DO_DEFINE_SHORT_GROUP_ALIASES}"
if [ "${DO_DEFINE_SHORT_GROUP_ALIASES:-}" = "y" ]
then
    alias fb=sd-backup-files
    alias fls=sd-files-in-dir
    alias sd=sd-default
    alias sdd=sd-dirs
    alias sdde=sd-empty-dirs
    alias sddu=sd-dirs-unsorted
    alias sdd1=sd-depth-1-dirs
    alias sddd1=sd-depth-1-dirs-short
    alias sdd2=sd-depth-2-dirs
    alias sdd3=sd-depth-3-dirs
    alias sde=sd-ext
    alias sdf=sd-files
    alias sdfu=sd-files-unsorted
    alias sdg=sd-git-repo
    alias sdh=sd-html-sources
    alias sdj=sd-java-sources
    alias sdl=sd-symlinks
    alias sdlu=sd-symlinks-unsorted
    alias sdo=sd-org-mode-sources
    alias sdp=sd-python-sources
    alias sdt=sd-text-files
    alias sdu=sd-unsorted
    alias sel=sd-emacs-lisp-sources
fi


###
### Functions.
###
###
### Please keep these in caseless alphabetical order by function name so that
### they can be more easily found.
###


##
## Utility functions.
##
## Please keep these in caseless alphabetical order by function name so that
## they can be more easily found.
##

## Returns 0 iff we have exactly one argument and it's a (searchdown) help
## option.
function _isSingleHelpOption() {
    if [ $# -eq 1 ]
    then
        [ "$1" = "-h" ] || [ "$1" = "-?" ] || [ "$1" = "--help" ] || return 1
    else
        return 1
    fi

    return 0
}


## Outputs the searchdown help message to stardard output.
function _outputHelp() {
    searchdown --help | "${PAGER:-less}"
}


##
## Other functions.
##
## Please keep these in caseless alphabetical order by function name so that
## they can be more easily found.
##

## Like 'searchdown', except that it assumes that if it's given a single
## non-option argument then it's a string to grep for, and it also sorts its
## output and displays it in the default pager.
function sd-default() {
    if isSingleNonoption "$@"
    then
        searchdown -gn "$@" | sort | "${PAGER:-less}"
    elif _isSingleHelpOption "$@"
    then
        _outputHelp
    else
        searchdown "$@" | sort | "${PAGER:-less}"
    fi
}


## Displays in the default pager a sorted list of all of the directories in
## and under the current working directory. If a single non-option argument
## is specified then it is assumed to be a search term.
#
# See also: sd-dirs-unsorted.
function sd-dirs() {
    if isSingleNonoption "$@"
    then
        sd-default -td -gn "$@"
    elif _isSingleHelpOption "$@"
    then
        _outputHelp
    else
        sd-default -td "$@"
    fi
}


## Displays in the default pager a sorted list of all of the empty
## directories in and under the current working directory.
#
# See also: sd-dirs-unsorted.
function sd-empty-dirs() {
    if _isSingleHelpOption "$@"
    then
        _outputHelp
    else
        sd-default -td --empty "$@"
    fi
}


## Displays in the default pager a sorted list of all of the files of any
## type (including directories and symlinks) in and under the current working
## directory that have the file extension 'ext'. If a single non-option
## argument is specified after the extension then it is assumed to be a
## search term.
function sd-ext() {
    if [ $# -le 1 ]
    then
        if _isSingleHelpOption "$@"
        then
            _outputHelp
        else
            sd-default -e "$@"  # gives appropriate error if $# is 0
        fi
    else
        if [ $# -eq 2 ] && isSingleNonoption "$2"
        then
            sd-default -e "$1" -gn "$2"
        else
            sd-default -e "$@"
        fi
    fi
}


## Displays in the default pager a sorted list of all of the regular files in
## and under the current working directory. If a single non-option argument
## is specified then it is assumed to be a search term.
#
# See also: sd-files-unsorted.
function sd-files() {
    if isSingleNonoption "$@"
    then
        sd-default -tf -gn "$@"
    elif _isSingleHelpOption "$@"
    then
        _outputHelp
    else
        sd-default -tf "$@"
    fi
}



## Outputs the pathnames of all of the files in and under the current
## directory except those in and under subdirectories named '.git'.
#
# Note: the git version control program creates and uses subdirectories
# named '.git' for its files.
#
# See also: searchdown, sdf, ug.
#
# usage: sd-git-repo [sd-arg...]
function sd-git-repo() {
    if isSingleNonoption "$@"
    then
        sd-files -S .git -gn "$@" | grep -vFx .git | "${PAGER:-less}"
    elif _isSingleHelpOption "$@"
    then
        _outputHelp
    else
        sd-files -S .git "$@" | grep -vFx .git | "${PAGER:-less}"
    fi
}


## Outputs all of the regular files with file extension 'ext' that the
## searchdown command would output given the (other) arguments 'args' (unless
## 'args' consists of a single help option, in which case the searchdown help
## message is output instead, or 'args' is a single non-option, in which case
## it outputs the matches to 'args' (considered as a regular expression) in
## all of the regular files in with extension 'ext' in and under the current
## working directory).
#
# Note: at least currently our definition of 'source code file' is pretty
# flexible: it just has to be a regular file with the extension 'ext'.
#
# usage: sd-source-code ext [args]
function sd-source-code() {
    local ext="$1"
    shift

    if isSingleNonoption "$@"
    then
        sd-default -tf -e "$ext" -gn "$@"
    else
        if _isSingleHelpOption "$@"
        then
            _outputHelp
        else
            sd-default -tf -e "$ext" "$@"
        fi
    fi
}


## Displays in the default pager a sorted list of all of the symbolic links
## in and under the current working directory. If a single non-option
## argument is specified then it is assumed to be a search term.
#
# See also: sd-symlinks-unsorted.
function sd-symlinks() {
    if isSingleNonoption "$@"
    then
        sd-default -tl -gn "$@"
    elif _isSingleHelpOption "$@"
    then
        _outputHelp
    else
        sd-default -tl "$@"
    fi
}


## Does the same thing as sd-default() except that its output is NOT sorted
## (which can output the first data faster when there's a LOT of it).
#
# See also: sd-default().
function sd-unsorted() {
    if isSingleNonoption "$@"
    then
        searchdown -gn "$@"
    elif _isSingleHelpOption "$@"
    then
        _outputHelp
    else
        searchdown "$@" | "${PAGER:-less}"
    fi
}
