#
# Cookbook:: php
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
app = search(:aws_opsworks_app).first
app_path = "/var/www/html/#{app['shortname']}"

package "git" do
  options "--force-yes" 
end

application app_path do
  git app_path do
    repository app["app_source"]["url"]
    revision app["app_source"]["revision"]
    action :sync
  end
end