# Git Server

A simple self-hosted Git server (SSH access only).

> NOTE:
>
> -   SSH access only.
> -   The use of Docker is optional.

## Setup Instructions

-   Clone this repository

    ```bash
    $ git clone https://github.com/HarshKapadia2/git-server.git
    ```

-   For non-Docker installs, run the [`setup` script](setup).

    ```bash
    $ cd git-server/
    $ ./setup --pwd <value>
    # Or
    $ ./setup --help
    ```

-   For Docker installs

    -   Ensure [Docker](https://harshkapadia2.github.io/docker) is installed and running.
    -   Run the [`Dockerfile`](Dockerfile).

    ```bash
    $ cd git-server/
    $ docker build . -t ubuntu-git-server
    ```

    -   Run a container in the background.

    ```bash
    $ docker container run --name git-server ubuntu-git-server
    ```

    -   To access the container

    ```bash
    $ docker container exec -it ubuntu-git-server bash
    ```

-   NOTE:
    -   The Git server lives in a new user (and group) called `git`.
    -   Repositories have to be created in `/srv/git` by the `git` user.
    -   Currently, only SSH access is supported.

## Script Arguments

The [`setup` script](setup) accepts two arguments

-   `pwd`
    -   Password
    -   Requirement: Always
-   `help`
    -   Prints detailed argument details.
    -   Requirement: Optional

## Adding New Repositories

-   Access the Git server and switch to the `git` user.

    ```bash
    $ ssh git@server_hostname
    $ su - git # Run to switch user to 'git', only if required
    ```

-   Navigate to the `/srv/git` directory.

    ```bash
    $ cd /srv/git
    ```

-   Create a new directory there with the name of the repository appended with a `.git`.

    ```bash
    $ mkdir repo_name.git
    ```

-   Inside the newly created directory, create a bare Git repository.

    ```bash
    $ cd repo_name.git
    $ git init --bare
    ```

## Resources

-   [How to Create Your Own Git Server](https://www.inmotionhosting.com/support/website/git/git-server)
-   [Git internals](https://git.harshkapadia.me)

