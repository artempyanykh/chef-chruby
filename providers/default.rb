action :install do
  version = new_resource.name

  if ::File.exists? '/usr/local/bin/chruby-exec'
    Chef::Log.info("chruby already installed. Skipping installation...")
  else
    ark "chruby" do
      url "https://github.com/postmodern/chruby/archive/v#{version}.tar.gz"
      action :install_with_make
    end

    # Replace chruby-exec with the one with fixed sourcing
    cookbook_file "chruby-exec" do
      path '/usr/local/bin/chruby-exec'
      mode 0755
      cookbook "chruby"
    end
  end
end

