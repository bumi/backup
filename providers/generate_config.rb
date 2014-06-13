action :setup do
  %w{keys models logs}.each do |p|
    directory "#{new_resource.base_dir}/#{p}" do
      action :create
      recursive true
    end
  end

  template "#{new_resource.base_dir}/config.rb" do
    cookbook "backup"
    source "config.rb.erb"
  end
  new_resource.updated_by_last_action(true)
end

action :remove do
  directory new_resource.base_dir do
    action :remove
    recursive true
  end
  new_resource.updated_by_last_action(true)
end

