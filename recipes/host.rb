#
# Cookbook Name:: kvm
# Recipe:: host
#
# Copyright 2013, Thomas Boerger
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

include_recipe "libvirt"
include_recipe "kernel"

node["kvm"]["host"]["packages"].each do |name|
  package name do
    action :install
  end
end

kernel_modules "kvm" do
  if node["cpu"][0]["flags"].include? "vmx"
    modules %w(kvm kvm-intel)
  end

  if node["cpu"][0]["flags"].include? "svm"
    modules %w(kvm kvm-amd)
  end

  action :load
end
