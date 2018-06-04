require "google/apis/compute_v1"

class InventoryNatIpsExtractor
  def initialize(project:, zone:)
    @project = project
    @zone = zone
  end

  def extract
    get_nat_ips
  end

  private

  attr_reader :project, :zone

  def service
    @service ||= begin
      service = Google::Apis::ComputeV1::ComputeService.new
      service.authorization = Google::Auth.get_application_default(['https://www.googleapis.com/auth/cloud-platform'])
      service
    end
  end

  def get_instances
    service.fetch_all do |token|
      service.list_instances(project, zone, page_token: token)
    end
  end

  def get_interfaces
    get_instances.flat_map(&:network_interfaces)
  end

  def get_access_configs
    get_interfaces.flat_map(&:access_configs)
  end

  def get_nat_ips
    get_access_configs.map(&:nat_ip).compact
  end
end
