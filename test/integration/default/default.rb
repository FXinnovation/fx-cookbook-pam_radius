#
# Inspec tests for pam_radius
#
# the Inspec reference, with examples and extensive documentation, can be
# found at https://inspec.io/docker/reference.resources/
#

# Defining package name to use according to platform family
package_name = case os.family
               when 'rhel'
                 'pam_radius'
               when 'debian'
                 'libpam-radius-auth'
               else
                 ''
               end

# Defining configuration file according to platofrm family
configuration_file = case os.family
                     when 'rhel'
                       '/etc/pam_radius.conf'
                     when 'debian'
                       '/etc/pam_radius_auth.conf'
                     else
                       ''
                     end

# Beginning tests
control 'pam_radius - 01' do
  title 'Ensure package is installed'
  describe package('pam_radius') do
    it { should be_installed }
  end
end

control 'pam_radius - 02' do
  title 'Ensure configuration is done'
  describe file('/etc/pam_radius.conf') do
    it           { should exist }
    it           { should be_file }
    its('mode')  { should cmp '0600' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
  end
end
