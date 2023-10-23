#PAra el futuro cuando necesite agregar una segunda interfaz a una misma instancia

#resource "aws_network_interface" "this" {
#  count = length(var.network_interfaces)
#
#  subnet_id       = aws_subnet.public_a.id
#  private_ips     = ["10.0.0.50"]
#  security_groups = [aws_security_group.web.id]
#
#  attachment {
#    instance     = aws_instance.this.id
#    device_index = count.index
#  }
#}