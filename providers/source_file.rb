action :install do
  ruby_version = new_resource.ruby_version
  mode = new_resource.mode
  user = new_resource.user
  group = new_resource.group

  template new_resource.name do
    source "chruby.sh.erb"
    mode mode
    owner user
    group group
    variables ruby_version: ruby_version
    cookbook "chruby"
  end
end
