class Chef
  class Recipe
    def chruby_install(&block)
      attr_box = Chruby::AttrBox.new
      attr_box.instance_eval(&block)

      version = attr_box.version || node[:chruby][:version]

      if ::File.exists? '/usr/local/bin/chruby-exec'
        Chef::Log.info("chruby already installed. Skipping installation...")
      else
        ark "chruby" do
          url "https://github.com/postmodern/chruby/archive/v#{version}.tar.gz"
          action :install_with_make
        end
      end
    end
  end
end
