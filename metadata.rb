name             'pam_radius'
license          'MIT'
maintainer       'FXinnovation'
maintainer_email 'cloudsquad@fxinnovation.com'
description      'Installs and configures pam-radius'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.3.1'
chef_version     '>= 12.1' if respond_to?(:chef_version)
issues_url       'https://bitbucket.org/fxadmin/public-common-cookbook-pam_radius/issues'
source_url       'https://bitbucket.org/fxadmin/public-common-cookbook-pam_radius'
supports         'redhat', '>= 6.0'
supports         'centos', '>= 6.0'
supports         'ubuntu', '>= 14.04'
supports         'debian', '>= 8.10'
