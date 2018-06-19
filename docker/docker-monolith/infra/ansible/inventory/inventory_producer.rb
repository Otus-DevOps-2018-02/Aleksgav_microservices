class InventoryProducer
  def initialize(extractor:, generator:)
    @extractor = extractor
    @generator = generator
  end

  def produce
    ips = extractor.extract

    generator.add_hosts(tag_name: "docker-reddit-app".to_sym, ips: ips) if ips

    generator.generate
  end

  private

  attr_reader :extractor, :generator
end
