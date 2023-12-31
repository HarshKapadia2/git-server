# Git Server

A simple self-hosted Git server (SSH access only).

## Setup Instructions

-   Clone this repository

    ```bash
    $ git clone https://github.com/HarshKapadia2/git-server.git
    ```

-   Run the [`setup` script](setup).

    ```bash
    $ cd git-server/
    $ ./setup --pwd <value> --default-branch <branch_name>
    # Or
    $ ./setup --help
    ```

> NOTE:
>
> -   The Git server lives in a new user (and group) called `git`.
> -   Repositories have to be created in `/srv/git` **by the `git` user**.
> -   Currently, only SSH access is supported.

## Script Arguments

The [`setup` script](setup) arguments

-   `--pwd <value>`
    -   Password for the Git server account. Used for SSH as well.
    -   Value: A string. An empty string is not allowed.
    -   Requirement: Always
-   `--default-branch <branch_name>`
    -   Optionally specify the default branch that Git should use for the initial branch.
    -   Value: A string. Default value is `master`.
    -   Requirement: Optional
-   `--help`
    -   Print this command usage instruction.
    -   Value: No value should be entered.
    -   Requirement: Optional

## Adding New Repositories

-   Access the Git server and switch to the `git` user.

    ```bash
    $ ssh git@server_hostname
    ```

-   Create a new directory in `/src/git` with the name of the repository appended with a `.git`.

    ```bash
    $ mkdir /srv/git/repo_name.git
    ```

-   Inside the newly created directory, create a bare Git repository.

    ```bash
    $ cd /srv/git/repo_name.git
    $ git init --bare
    ```

## Resources

-   [How to Create Your Own Git Server](https://www.inmotionhosting.com/support/website/git/git-server)
-   [Git internals](https://git.harshkapadia.me)
-   Bare Git repositories
    -   [What is a bare repository and why would I need one?](https://stackoverflow.com/questions/37992400/what-is-a-bare-repository-and-why-would-i-need-one)
    -   [all about "bare" repos -- what, why, and how to fix a non-bare push](https://htmlpreview.github.io/?https://github.com/sitaramc/sitaramc.github.com/blob/dce410b2a2804723676db9cabd7bb506b6d9ba05/concepts/bare.html)
    -   [What's the -practical- difference between a Bare and non-Bare repository?](https://stackoverflow.com/questions/5540883/whats-the-practical-difference-between-a-bare-and-non-bare-repository)
