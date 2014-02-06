actions :install

default_action :install

attribute :mode, kind_of: [String, Fixnum], default: 0644
attribute :owner, kind_of: String
attribute :group, kind_of: String
attribute :ruby_version, kind_of: String
