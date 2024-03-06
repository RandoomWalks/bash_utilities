declare -A bokmarks # A associative array to hold bookmarks

# Function to add a bookmark
bokmark() {
    local name=$1
    if [[ -z "$name" ]]; then
        echo "Usage: bokmark <bookmark_name>"
        return 1
    fi

    # Add the current directory to the named bookmark list
    bokmarks["$name"]="${bokmarks["$name"]}:$PWD"
}

# Function to go to a bookmark or list bookmarks under a name
bok() {
    local name=$1
    if [[ -z "${bokmarks[$name]}" ]]; then
        echo "Bookmark not found."
        return 1
    fi

    # Split the paths in the bookmark by ':' and convert them into an array
    IFS=':' read -r -a paths <<< "${bokmarks[$name]}"

    if [[ ${#paths[@]} -eq 1 ]]; then
        # Only one path under this bookmark, navigate directly
        cd "${paths[0]}" || return
    else
        # Multiple paths under this bookmark, list them
        echo "Multiple paths found for $name:"
        for i in "${!paths[@]}"; do
            echo "$((i + 1)): ${paths[i]}"
        done
        # Prompt the user to choose one
        read -p "Enter number to navigate: " index
        if [[ $index =~ ^[0-9]+$ ]] && (( index > 0 && index <= ${#paths[@]} )); then
            cd "${paths[$((index - 1))]}" || return
        else
            echo "Invalid selection."
            return 1
        fi
    fi
}

# Usage for setting a bookmark:
# bokmark mybok

# Usage for navigating to a bookmarked directory or choosing from multiple:
# bok mybok


unbokmark() {
    local name=$1
    if [[ -z "$name" ]]; then
        echo "Usage: unbokmark <bookmark_name>"
        return 1
    fi

    if [[ -z "${bokmarks[$name]}" ]]; then
        echo "Bookmark '$name' not found."
    else
        unset bokmarks["$name"]
        echo "Bookmark '$name' removed."
    fi
}

unbok() {
    local name=$1
    if [[ -z "${bokmarks[$name]}" ]]; then
        echo "Bookmark '$name' not found."
        return 1
    fi

    IFS=':' read -r -a paths <<< "${bokmarks[$name]}"
    if [[ ${#paths[@]} -eq 1 ]]; then
        # Only one path, remove the entire bookmark
        unset bokmarks["$name"]
        echo "Bookmark '$name' removed."
    else
        echo "Multiple paths found for $name:"
        for i in "${!paths[@]}"; do
            echo "$((i + 1)): ${paths[i]}"
        done
        read -p "Enter number to remove: " index
        if [[ $index =~ ^[0-9]+$ ]] && (( index > 0 && index <= ${#paths[@]} )); then
            # Remove selected path from bookmark
            unset paths[$((index - 1))]
            # Reassemble bookmark without removed path
            bokmarks["$name"]=$(IFS=:; echo "${paths[*]}")
            echo "Path $index removed from bookmark '$name'."
        else
            echo "Invalid selection."
            return 1
        fi
    fi
}
