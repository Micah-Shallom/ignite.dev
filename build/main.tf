terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "express" {
  name         = "mshallom/node:v1"
  keep_locally = false
}

resource "docker_container" "express_app" {
  image = docker_image.express.image_id
  name  = "express_app"

  ports {
    internal = 3000
    external = 3000
  }
}
