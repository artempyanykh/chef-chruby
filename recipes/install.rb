include_recipe "chruby::default"

chruby node[:chruby][:version]
