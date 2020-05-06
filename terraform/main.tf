# Start the NGINX+ Container
resource "docker_container" "NginxPlusWebApp" {
  name  = "NginxPlusWebApp"
  image = "nginx-plus:34rc3"
  ports {
    internal = "${lookup(var.int_port, var.env)}"
    external = "${lookup(var.ext_port, var.env)}"
    ip = "${lookup(var.ext_ip_Web, var.env)}"
  }
  ports {
    internal = "${var.int_port_TLS}"
    external = "${var.ext_port_TLS}"
    ip = "${lookup(var.ext_ip_Web, var.env)}"
  }
  restart = "always"
  dns = ["172.17.0.1"]
  dns_search = ["nginx-udf.internal"]
  hostname = "WebApp"
  host {
    host = "controller.nginx-udf.internal"
    ip = "10.1.20.11"
  }
}

resource "docker_container" "NginxPlusAPI" {
  name  = "NginxPlusAPI"
  image = "nginx-plus:34rc3"
  ports {
    internal = "${lookup(var.int_port, var.env)}"
    external = "${lookup(var.ext_port, var.env)}"
    ip = "${lookup(var.ext_ip_API, var.env)}"
  }
  ports {
    internal = "${var.int_port_TLS}"
    external = "${var.ext_port_TLS}"
    ip = "${lookup(var.ext_ip_API, var.env)}"
  }
  restart = "always"
  dns = ["172.17.0.1"]
  dns_search = ["nginx-udf.internal"]
  hostname = "API"
  host {
    host = "controller.nginx-udf.internal"
    ip = "10.1.20.11"
  }
}

resource "docker_container" "NginxPlusDevPortal" {
  name  = "NginxPlusDevPortal"
  image = "nginx-plus:34rc3"
  ports {
    internal = "8090"
    external = "8090"
    ip = "10.1.20.12"
  }
  restart = "always"
  dns = ["172.17.0.1"]
  dns_search = ["nginx-udf.internal"]
  hostname = "devportal"
  host {
    host = "controller.nginx-udf.internal"
    ip = "10.1.20.11"
  }
}
