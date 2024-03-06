
### Setting Up Bookmarks

1. **Creating bookmarks for different projects:**

    Suppose you're working on several projects located in different directories, and you want to bookmark each for quick access.

    ```bash
    cd /home/user/projects/project1
    bokmark proj
    cd /home/user/projects/project2
    bokmark proj
    cd /home/user/projects/project3
    bokmark proj
    ```

    Here, you've created a bookmark named `proj` that contains paths to `project1`, `project2`, and `project3`.

2. **Adding a documentation directory to a new bookmark:**

    Now, you want to bookmark a directory where you keep documentation.

    ```bash
    cd /home/user/documentation
    bokmark docs
    ```

    You've created another bookmark named `docs` for quick navigation to your documentation.

### Navigating Using Bookmarks

1. **Going to a project directory:**

    You want to work on `project2`. Since it's part of the `proj` bookmark, use `bok` to navigate there.

    ```bash
    bok proj
    ```

    If `proj` contains multiple paths, you'll see a list of them. Choose the number corresponding to `project2` to navigate there.

2. **Accessing documentation:**

    You need to consult your documentation.

    ```bash
    bok docs
    ```

    This command takes you directly to `/home/user/documentation` since `docs` only has one path.

### Managing Bookmarks

1. **Removing a specific project from a bookmark:**

    Let's say `project1` is no longer active, and you want to remove it from the `proj` bookmark.

    ```bash
    unbok proj
    ```

    You'll see a list of paths under `proj`. Choose the number corresponding to `project1` to remove it from the bookmark.

2. **Deleting an entire bookmark:**

    If you're done with all projects in the `proj` bookmark and want to clean up.

    ```bash
    unbokmark proj
    ```

    This command removes the `proj` bookmark entirely, including all paths associated with it.
