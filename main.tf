data "ibm_space" "space" {
  space = "${var.space}"
  org   = "${var.org}"
}

data "ibm_app_domain_shared" "domain" {
    name = "${var.region}.cf.appdomain.cloud"
}

resource "ibm_app_route" "route" {
    domain_guid     = "${data.ibm_app_domain_shared.domain.id}"
    space_guid      = "${data.ibm_space.space.id}"
    host            = "${var.app_host}"
}

resource "null_resource" "git_clone" {

    provisioner "local-exec" {
        command ="wget ${var.app_zip_url} -O ./app.zip "
    }

}

resource "ibm_app" "app" {
    name            = "${var.app_name}"
    instances       = "${var.instances}"
    space_guid      = "${data.ibm_space.space.id}"
    route_guid      = ["${ibm_app_route.route.id}"]
    memory          = "${var.memory}"
    app_path        = "./app.zip"
    depends_on      = ["null_resource.git_clone", "ibm_app_route.route"]
}
