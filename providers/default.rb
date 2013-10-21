action :install_dependencies do
  directory=@new_resource.directory
  gem_file=::File.join(directory, "Gemfile")
  if ::File.exists?(gem_file)
    execute "bundle install --gemfile #{gem_file} --system"
  else
    node[:compass_style][:gem_dependencies].each do |gem_pkg|
      %w{/usr/bin/gem /usr/local/bin/gem}.each do |gem_bin|
        Chef::Log.info "installing #{gem_pkg} to #{gem_bin}"
        gem_package "#{gem_pkg}" do
          action :install
          gem_binary "#{gem_bin}"
          only_if { ::File.exists? gem_bin }
        end
      end
    end
  end
end

action :compile do
  directory=@new_resource.directory
  execute "compass compile #{directory}" do
    only_if { ::File.exists?(::File.join(directory, "config.rb")) }
  end
end
