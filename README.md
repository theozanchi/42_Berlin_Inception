![Webserver logo](.media/42_project_banner.png)

![Grade badge](https://img.shields.io/badge/TBC-004d40?label=final%20grade&labelColor=151515&logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGhlaWdodD0iMjRweCIgdmlld0JveD0iMCAwIDI0IDI0IiB3aWR0aD0iMjRweCIgZmlsbD0iI0ZGRkZGRiI+PHBhdGggZD0iTTAgMGgyNHYyNEgweiIgZmlsbD0ibm9uZSIvPjxwYXRoIGQ9Ik0xMiAxNy4yN0wxOC4xOCAyMWwtMS42NC03LjAzTDIyIDkuMjRsLTcuMTktLjYxTDEyIDIgOS4xOSA4LjYzIDIgOS4yNGw1LjQ2IDQuNzNMNS44MiAyMXoiLz48L3N2Zz4=) ![Language Badge](https://img.shields.io/badge/Docker-0db7ed?logo=docker&label=language&labelColor=151515)

# Inception

This project is about setting up a wordpress website using a Docker container with NGINX and MariaDB.

The full subject can be found [here](.media/en.subject.pdf).

# Downloading and compiling the project

Clone the repository and use `make` to compile
```shell
git clone https://github.com/theozanchi/42_Berlin_inception/tree/main
cd 42_Berlin_inception
make
```
You need to have Docker installed in order for it to work

# Details about the project infrastructure
The project has to be set up within a virtual machine in order to have sudo rights (we do not have sudo rights on the school network).

![Project architecture](.media/project_architecture.png)

Docker-compose is used to build the project. Each service has a dedicated container.
