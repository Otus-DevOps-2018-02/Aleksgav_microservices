variable zone {
  description = "Zone for instance"
  default     = "europe-west1-b"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable disk_image {
  description = "Disk image"
}

variable instances_quantity {
  description = "Quantity of instances"
  default     = 1
}
