action :install do
  version = new_resource.name

  if ::File.exists? '/usr/local/bin/chruby-exec'
    Chef::Log.info("chruby already installed. Skipping installation...")
  else
    ark "chruby" do
      url "https://github.com/postmodern/chruby/archive/v#{version}.tar.gz"
      action :install_with_make
    end
  end
end

