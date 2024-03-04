terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.0.0"
    }
  }
}

provider "docker" {
  registry_auth {
    address  = "https://index.docker.io/v1/"
    username = "vaibhavkalel"
    password = "vaibhav2115"
  }
}

resource "docker_image" "vaibhavkalel" {
  name         = "tf_docker_image:latest"
  keep_locally = false
}

resource "docker_container" "tf_docker_container" {
  image = docker_image.vaibhavkalel.name
  name  = "terraform_docker_container"
  ports {
    internal = 80
    external = 8000
  }
}
