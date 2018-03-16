#
# cookbook::pam_radius
# resource::pam_radius
#
# author::fxinnovation
# description::This resource allows you to install and configure pam_radius.so
#

# Defining resource name
resource_name :pam_radius

# Declaring provider
provides :adjoin_fx, platform_family: 'rhel'

# Defining properties
property :configuration, Array, default: [], sensitive: true

# Defining default action
default_action :install

# Defining install action
action :install do
  # installing package
  package 'pam_radius'

  # Initializing empty array
  lines = []

  # Generating configuration lines from config hash
  new_resource.configuration.each do |config|
    line = config['host'].dup
    line << ":#{config['port'].dup}" unless config['port'].nil?
    line << " #{config['shared_secret'].dup}"
    line << " #{config['timeout'].dup}"
    line << " #{config['source_ip'].dup}" unless config['source_ip'].nil?
    line << " #{config['vrf'].dup}" unless config['vrf'].nil?
    lines.push(line)
  end

  # configuring radius server
  template '/etc/pam_radius.conf' do
    source    'pam_radius.conf.erb'
    cookbook  'pam_radius'
    owner     'root'
    group     'root'
    mode      '0600'
    sensitive true
    variables(
      lines: lines
    )
  end
end
