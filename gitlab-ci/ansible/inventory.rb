#!/usr/bin/env ruby

require_relative "inventory/inventory_nat_ip_extractor"
require_relative "inventory/inventory_json_generator"
require_relative "inventory/inventory_producer"

project = "docker-203423"
zone = "europe-west1-b"

extractor = InventoryNatIpsExtractor.new(project: project, zone: zone)
generator = InventoryJSONGenerator.new
producer = InventoryProducer.new(extractor: extractor, generator: generator)

puts producer.produce
