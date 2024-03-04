terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.0.0"
    }
  }
}

resource "docker_image" "tf_docker_image" {
  name         = "tf_docker_image:latest"
  keep_locally = false
}

resource "docker_container" "tf_docker_image" {
  image = docker_image.tf_docker_image.id  # Use 'id' instead of 'latest'
  name  = "terraform_docker_container"
  ports {
    internal = 80
    external = 8000
  }
}
