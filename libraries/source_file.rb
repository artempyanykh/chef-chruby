class Chef
  class Recipe
    def chruby_source_file(&block)
      attr_box = Chruby::AttrBox.new
      attr_box.instance_eval(&block)

      ruby_version = attr_box.ruby_version
      destination = attr_box.destination
      mode = attr_box.mode
      owner = attr_box.owner
      group = attr_box.group

      template destination do
        source "chruby.sh.erb"
        mode mode
        owner owner
        group group
        variables ruby_version: ruby_version
      end
    end
  end
end
