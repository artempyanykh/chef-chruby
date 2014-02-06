action :install do
  ruby_version = new_resource.ruby_version
  mode = new_resource.mode
  owner = new_resource.owner
  group = new_resource.group

  template new_resource.name do
    source "chruby.sh.erb"
    mode mode
    owner owner
    group group
    variables ruby_version: ruby_version
    cookbook "chruby"
  end
end
