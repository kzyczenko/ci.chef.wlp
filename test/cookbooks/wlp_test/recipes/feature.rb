# Cookbook Name:: wlp_test
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

include_recipe "wlp::default"
include_recipe "wlp::repositories_properties"

wlp_download_feature "collective download" do
  name "clusterMember-1.0"
  directory "/opt/was/liberty/features"
  accept_license true
end

wlp_install_feature "Liberty" do
  name "collectiveController-1.0"
  accept_license true
end

node.override[:wlp][:liberty_repository] = false
node.override[:wlp][:hosted_repository_url] = "http://192.168.168.14:9080/ma/v1"

include_recipe "wlp::repositories_properties"

wlp_install_feature "LARS" do
  name "explore-1.0"
  accept_license true
end

node.override[:wlp][:liberty_repository] = false
node.override[:wlp][:repository_url] = nil
node.override[:wlp][:local_repository_url] = "/opt/was/liberty/features"

include_recipe "wlp::repositories_properties"

wlp_install_feature "Local" do
  name "clusterMember-1.0"
  accept_license true
end
