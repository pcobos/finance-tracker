require 'rubygems'
require 'zapier_ruby'

ZapierRuby.configure do |c|
 c.web_hooks = {example_zap: "b1f6mz4"}
 c.enable_logging = false
 c.account_id = "11454267"
end

zapper = ZapierRuby::Zapper.new(:example_zap)

if zapper.zap({name: "whisker", email: "test@test.com"})
  puts "zapped it"
else
  puts "it remains unzapped"
end