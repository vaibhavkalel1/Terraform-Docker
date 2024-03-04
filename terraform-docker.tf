terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.0.0"  # Use a version constraint to specify the provider version
    }
  }
}

resource "docker_image" "tf_docker_image" {
  name         = "tf_docker_image:latest"
  keep_locally = false
}

resource "docker_container" "tf_docker_image" {
  image = docker_image.tf_docker_image.latest
  name  = "terraform_docker_container"
  ports {
    internal = 80
    external = 8000
  }
}
