# navigate up a specified number of directory levels in a single command. 

# Current Directory: /home/user/projects/my_project/src/components
# bck 3
# New Directory: /home/user/projects/my_project

# Attempt with a non-integer
# bck three
# Output: Error: Argument must be a positive integer.

# Assuming the current directory is /home/user
# bck 5
# Output: Error: Cannot move up 5 directories.


bck () 
{ 
    local up_count=${1:-1};
    if [[ ! $up_count =~ ^[0-9]+$ ]]; then
        echo "Error: Argument must be a positive integer.";
        return 1;
    fi;
    local new_dir=$(printf "../%.0s" $(seq 1 $up_count));
    new_dir=$(realpath -m $new_dir);
    if [ -d "$new_dir" ]; then
        cd "$new_dir";
    else
        echo "Error: Cannot move up $up_count directories.";
        return 2;
    fi
}

#  extract various compressed files without needing to remember specific commands.
xtrac () {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2) tar xjf $1   ;;
            *.tar.gz)  tar xzf $1   ;;
            *.bz2)     bunzip2 $1   ;;
            *.rar)     unrar x $1   ;;
            *.gz)      gunzip $1    ;;
            *.tar)     tar xf $1    ;;
            *.tbz2)    tar xjf $1   ;;
            *.tgz)     tar xzf $1   ;;
            *.zip)     unzip $1     ;;
            *.Z)       uncompress $1;;
            *.7z)      7z x $1      ;;
            *)         echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

mkcd () {
    mkdir -p "$1" && cd "$1"
}
