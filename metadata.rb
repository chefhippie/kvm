name "kvm"
maintainer "Thomas Boerger"
maintainer_email "tboerger@tbpro.de"
license "Apache 2.0"
description "Installs/Configures kvm"
long_description IO.read(File.join(File.dirname(__FILE__), "README.md"))
version "0.0.1"
depends "kernel"
recipe "kvm", "Installs/Configures kvm"

supports "suse", ">= 12.3"
supports "debian", ">= 7.0"
supports "ubuntu", ">= 12.04"
