# Define the provider and required version
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.0.0"
    }
  }
}

# Configure the Docker provider
provider "docker" {
  # If you're authenticating with Docker Hub, you don't need to specify registry_auth
}

# Define the Docker image resource
resource "docker_image" "my_image" {
  name         = "vaibhavkalel/tf_docker_image:latest"  # Adjusted repository/name for Docker Hub
  keep_locally = false
  
  # Specify how to build the Docker image
  build {
    context    = "./"
    dockerfile = "./Dockerfile"
  }
}

# Define the Docker container resource
resource "docker_container" "my_container" {
  image = vaibhavkalel/tf_docker_image.docker_image.latest
  name  = "terraform_docker_container"
  ports {
    internal = 80
    external = 8000
  }
}
