### Jumping Up the Directory Tree with `bck()`

The `bck()` function allows you to move up multiple directory levels in a single command, simplifying navigation in deep directory structures.

#### Sample Usage

- **Jump up the path tree**

    - **Current Directory**: `/home/user/projects/my_project/src/components`
    - **Command**: `bck 3`
    - **New Directory**: `/home/user/projects/my_project`

  This command moves you up three directory levels from a deeply nested location in your project back to the project root.

### Directory Bookmarks with `bokmark` and `bok`

The bookmark system comprises two functions: `bokmark` for creating bookmarks to directories and `bok` for navigating to those bookmarked directories. This system is particularly useful for quickly accessing frequently used directories.

#### Creating Bookmarks (please see bokmarks_usage.md)

1. Navigate to the directory you wish to bookmark and use `bokmark` to create a bookmark:

    ```bash
    cd /home/user/projects/project1
    bokmark proj
    cd /home/user/projects/project2
    bokmark proj
    cd /home/user/projects/project3
    bokmark proj
    ```

#### Navigating to Bookmarked Directories

- Use `bok` followed by the bookmark name to navigate. If the bookmark contains multiple paths, you will be prompted to select one:

    ```bash
    bok proj
    ```

    **Output**:
    ```
    Multiple paths found for proj:
    1: /home/user/projects/project1
    2: /home/user/projects/project2
    3: /home/user/projects/project3
    Enter number to navigate:
    ```

- **Example**: Entering `2` navigates you to `/home/user/projects/project2`.
