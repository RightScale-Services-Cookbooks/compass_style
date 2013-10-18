compass_style "#{node[:compass_style][:project_directory]}" do
  action :install_dependencies
end

compass_style "#{node[:compass_style][:project_directory]}" do
  action :compile
end

