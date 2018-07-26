#
# Cookbook:: php
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
app = search(:aws_opsworks_app).first
app_path = "/var/www/html/#{app['shortname']}"

git_client 'default' do
    action :install
end

deploy app_path do
    repo app["app_source"]["url"]
    revision app["app_source"]["revision"]
    action :deploy
end