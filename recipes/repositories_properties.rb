# Cookbook Name:: wlp
# Attributes:: default
#
# (C) Copyright IBM Corporation 2013.
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

=begin
#<
Creates the file etc/repositories.properties in the wlp dir to configure which repositories are used by installUtility
#>
=end

directory "#{node[:wlp][:base_dir]}/etc" do
  owner node[:wlp][:user]
  group node[:wlp][:group]
  mode '0755'
  action :create
end

file "#{node[:wlp][:base_dir]}/etc/repositories.properties" do
  content "useDefaultRepository=#{node[:wlp][:liberty_repository]} \nhostedRepository.url=#{node[:wlp][:hosted_repository_url]} \nlocalRepository.url=#{node[:wlp][:local_repository_url]}"
  owner 'wlp'
  group 'wlpadmin'
  mode '0644'
  action :create
end
