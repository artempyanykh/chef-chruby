action :install do 
  ruby_version = new_resource.ruby_version
  gem_name = new_resource.name
  group = new_resource.group
  user = new_resource.user
  passwd = Etc.getpwnam(user)

  execute "chruby_gem_install_#{gem_name}" do
    user user
    group group    
    command "chruby-exec #{ruby_version} -- gem install #{gem_name}"    
    environment ({'HOME' => passwd.dir, 'USER' => user}) 
    action :run
  end
end