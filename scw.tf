terraform {
	required_providers {
		scaleway  = {
			source = "scaleway/scaleway"
		}
	}

    required_version = ">= 0.13"
}

variable "profile" {
	type = string
	default = "default"
}

variable "availability_zone_names" {
	type    = string
	default = "nl-am-1"
}

variable "security_group_uuid" {
	type    = string
	description = "The id of the security group (UUID)"
	sensitive = true

	validation {
		condition = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", var.security_group_uuid))
		error_message = "must be a valid uuid"
	}
}

variable "os" {
	type = string
	description = "System distribution"
	default = "ubuntu_noble"
}

variable "ipv6" {
	type = bool
	default = true
}

variable "name" {
	type = string
}

variable "vm_type" {
	type = string
	default = "PLAY2-PICO"
}

provider "scaleway" {
	alias   = "p2"
	profile = "default"
	zone = var.availability_zone_names
}

resource "scaleway_instance_ip" "public_ip" {}
resource "scaleway_instance_volume" "data" {
	size_in_gb = 30
	type = "l_ssd"
	name = "staging-ssd"
}

resource "scaleway_instance_security_group_rules" "main" {
	security_group_id = var.security_group_uuid
}

resource "scaleway_instance_server" "staging" {
	type = var.vm_type
	image = var.os
	enable_ipv6 = var.ipv6
	name = var.name

	tags = ["tf", "staging"]
}