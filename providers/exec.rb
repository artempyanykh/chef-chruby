action :install do
  destination = new_resource.name

  cookbook_file "chruby-exec" do
    path destination
    mode 0755
    cookbook "chruby"
  end
end
