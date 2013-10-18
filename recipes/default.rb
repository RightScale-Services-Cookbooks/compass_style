#
# Cookbook Name:: compass-style
# Recipe:: default
#
# Copyright 2013, RightScale Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
rightscale_marker :begin

%w{/usr/bin/gem /usr/local/bin/gem}.each do |gem_bin|
  Chef::Log.info "installing compass to #{gem_bin}"
  gem_package "compass" do
    action :install
    gem_binary "#{gem_bin}"
    only_if { ::File.exists? gem_bin }
  end

  gem_package "bundler" do
    action :install
    gem_binary "#{gem_bin}"
    only_if { ::File.exists? gem_bin }
  end
end

chef_gem "compass" do
  action :install
end

rightscale_marker :end
