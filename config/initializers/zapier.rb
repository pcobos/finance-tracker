require 'rubygems'
require 'zapier_ruby'

ZapierRuby.configure do |c|
 c.web_hooks = {example_zap: "b9yz5m5"}
 c.enable_logging = false
 c.account_id = "11614338"
end

zapper = ZapierRuby::Zapper.new(:example_zap)

if zapper.zap({name: "Mr. Whiskers", email: "whisker@test.com"})
  puts "zapped it"
else
  puts "it remains unzapped"
end