#!/usr/bin/env ruby
#-*- coding: utf-8 -*-
require 'tumblr_client'
require 'yaml'

env = YAML.load_file('setting.yml') if File.exist?('setting.yml')


Tumblr.configure do |config|
  config.consumer_key = env['TUMBLR']['CONSUMER_KEY']
  config.consumer_secret = env['TUMBLR']['CONSUMER_SECRET']
  config.oauth_token = env['TUMBLR']['OAUTH_TOKEN']
  config.oauth_token_secret = env['TUMBLR']['OAUTH_TOKEN_SECRET']
end

client = Tumblr.new
post_file = Dir::glob(env['PATH']).sample
filename = File.basename(post_file,'.md')
dirname = File.dirname(post_file).split('/').select{|w| w unless w =~ /(Dropbox)|(memo)|(\.\.)/ }.join('')
title = dirname+filename
content =  ''


File.foreach(post_file){|file|
  content << file+"\n"
}


client.text(env['TUMBLR']['URL'], state: "published", title: title, body: content, format: 'markdown')
system("rm","-f",post_file)
puts "#{post_file} post now."
