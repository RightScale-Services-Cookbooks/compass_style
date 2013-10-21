compass_style "#{node[:compass_style][:project_directory]}" do
  dependencies node[:compass_style][:gem_dependencies]
  action :install_dependencies
end

compass_style "#{node[:compass_style][:project_directory]}" do
  action :compile
end

