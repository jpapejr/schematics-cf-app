data "ibm_space" "space" {
  space = "${var.space}"
  org   = "${var.org}"
}

resource "null_resource" "git_clone" {

    provisioner "local-exec" {
        command = <<EOT
        git clone ${var.source_repo} ./source \
        && cd ./source \
        && zip -r app.zip *
        EOT
    }

}

resource "ibm_app" "app" {
    name            = "${var.app_name}"
    instances       = "${var.instances}"
    space_guid      = "${data.ibm_space.space.id}"
    app_path        = "./source/app.zip"
}
