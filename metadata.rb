name             'compass_style'
maintainer       'RightScale Inc'
maintainer_email 'premium@rightscale.com'
license          'Apache 2.0'
description      'Installs/Configures compass-style'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.3'

depends "rightscale"

recipe "compass_style::default", "Installs Compass Gem"
recipe "compass_style::compile", "compiles css in project directory"


attribute "compass_style/project_directory",
  :display_name => "Compass Project Directory",
  :description => "Compass Project Directory",
  :required => "required",
  :recipes => [ "compass_style::compile" ]

attribute "compass_style/gem_dependencies",
  :display_name => "Compass Gem Dependencies",
  :description => "Compass Gem Dependencies, do not use if you use bundler",
  :required => "optional",
  :recipes => [ "compass_style::compile" ]
