# Practical task GHA for the intrnship GD

Original repositorium: https://github.com/spring-projects/spring-petclinic

## Prepare Docker Hub and geeral setups

For the purpose of solving this task, I prepared two repositories in Docker Hub:

* `main`
* `mr`

In GitHub Actions, I created several secrets to securely store credentials and configuration:

* `DOCKERHUB_TOKEN` — Docker Hub access token
* `DOCKER_USERNAME` — Docker Hub username
* `MAIN_REPO` — repository name `"main"`
* `MR_REPO` — repository name `"mr"`

And one configuration variable to store maven version:

* `MAVEN_IMAGE` - maven:3.9.11-amazoncorretto-17

## Creating workflows

Under the `.github/workflows/` directory, two workflows were created:

* **`build.yml`** — Runs on pull requests. At the end, it pushes a Docker image into the `"mr"` repository.
* **`build_main.yml`** — Runs on pushes to the `main` branch. At the end, it pushes a Docker image into the `"main"` repository.


### Notes

* **QEMU** is required when you want to build or test Docker images for different CPU architectures
    By default, a GitHub Actions runner only supports the architecture it runs on (x86_64).
    This is especially useful when you’re using Docker Buildx to create multi-platform Docker images


* **Docker Buildx** is an extended build tool for Docker that gives you more powerful features than the classic docker build.
    Lets you build images for different CPU architectures (e.g., linux/amd64, linux/arm64, linux/ppc64le) from one machine.
    Needs QEMU (like in your earlier step) if the runner’s CPU doesn’t match the target arch.