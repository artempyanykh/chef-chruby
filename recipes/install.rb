include_recipe "chruby::default"

chruby node[:chruby][:version]
chruby_exec node[:chruby][:chruby_exec_path]