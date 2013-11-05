#
# Cookbook Name:: kvm
# Attributes:: host
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

default["kvm"]["host"]["packages"] = %w(
  kvm
  virt-manager
)

case
when node["cpu"]["0"]["flags"].include?("vmx")
  default["kvm"]["host"]["kernel_modules"] = %w(kvm kvm-intel)
  default["kvm"]["host"]["kernel_options"] = ["options kvm-intel nested=1"]
when node["cpu"]["0"]["flags"].include?("svm")
  default["kvm"]["host"]["kernel_modules"] = %w(kvm kvm-amd)
  default["kvm"]["host"]["kernel_options"] = ["options kvm-amd nested=1"]
else
  default["kvm"]["host"]["kernel_modules"] = %w(kvm)
  default["kvm"]["host"]["kernel_options"] = %w()
end
