require 'yaml'
require 'resque'
require 'resque_scheduler'
require 'resque_scheduler/server'

Resque.schedule = YAML.load_file(File.join(File.dirname(__FILE__), "/resque_schedule.yml").to_s)

# set resque for resque_test in a namespace
Resque.redis.namespace = "resque_name_space_#{Rails.env}"