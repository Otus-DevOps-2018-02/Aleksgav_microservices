class InventoryJSONGenerator
  def initialize
    @tagged_hosts = {}
  end

  def add_hosts(tag_name:, ips:)
    tagged_hosts[tag_name] = { hosts: ips }
  end

  def generate
    tagged_hosts.to_json
  end

  private

  attr_reader :tagged_hosts
end
