require 'ruble'
require 'yaml'
require 'yaml/store'
require 'singleton'

module Lessconfig
  class Config
    include Singleton

    def initialize(file="less_config.yml")
      @file = file
      @config = YAML.load_file(ENV['TM_PROJECT_DIRECTORY']+"/"+@file)
    end

    def getvalue(key, group=nil, type=nil)

      if type == nil then
        return (group != nil) ? @config.fetch(group)[key] : @config[key]
      else
        return (group != nil) ? @config.fetch(group)[key].to_s : @config[key].to_s
      end

    end

    alias_method :get, :getvalue

    def setvalue(key, group=nil, value=nil)

      if value == nil then
        return nil
      end

      store = YAML::Store.new ENV['TM_PROJECT_DIRECTORY']+"/"+@file

      store.transaction do

        if (group != nil) then
          store[group][key] = value
        else
          store[key] = value
        end

      end

      @config = YAML.load_file(ENV['TM_PROJECT_DIRECTORY']+"/"+@file)
    end

    alias_method :set, :setvalue

  end
end

class Less

  def self.config(key, group=nil, type=nil)
    return Lessconfig::Config.instance.get(key, group, type)
  end

  def self.setconfig(key, group=nil, value=nil)
    return Lessconfig::Config.instance.set(key, group, value)
  end

end