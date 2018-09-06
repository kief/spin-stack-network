
module "dns-zones" {
  source = "infrablocks/dns-zones/aws"
  version = "~> 0.1"

  domain_name             = "${var.instance_identifier}.public.${var.base_dns_domain}"
  private_domain_name     = "${var.instance_identifier}.private.${var.base_dns_domain}"

  private_zone_vpc_region = "${var.region}"
  private_zone_vpc_id     = "${data.aws_vpc.region_default.id}"
}

data "aws_vpc" "region_default" {
  default = "true"
}
