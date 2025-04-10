provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  name  = "nginx_server"
  image = docker_image.nginx.latest

  ports {
    internal = 80
    external = 8080
  }

  volumes {
    host_path      = "${path.module}/html"
    container_path = "/usr/share/nginx/html"
  }
}
