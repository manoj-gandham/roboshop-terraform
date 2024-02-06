locals {
  name = var.env != "" ? "${var.component_name}-${var.env}" : var.component_name
  db_commands = [
    "rm -rf roboshop-shell",
    "git clone https://github.com/manoj-gandham/roboshop-shell.git",
    "cd roboshop-shell",
    "sudo bash ${var.component_name}.sh ${var.password}"
  ]
  app_commands = [
#  "sudo labauto ansible",
#    "ansible-playbook -i localhost, -U https://github.com/manoj-gandham/roboshop-ansible.git roboshop.yml -e env=${var.env} -e role_name= ${var.component_name}"
    "echo ok"
  ]
}