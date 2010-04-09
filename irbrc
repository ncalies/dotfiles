#!/usr/bin/env ruby

require 'rubygems'
require 'wirble'
require 'ap'

IRB.conf[:USE_READLINE] = true
IRB.conf[:PROMPT_MODE]  = :SIMPLE

require 'irb/completion'

IRB.conf[:AUTO_INDENT]  = true

require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

Wirble.init
Wirble.colorize

def clear
    system 'clear'
    return "Rails env: #{ENV['RAILS_ENV']}" if ENV['RAILS_ENV']
end

alias c clear

# Load / reload files faster
# http://www.themomorohoax.com/2009/03/27/irb-tip-load-files-faster
def fl(file_name)
   file_name += '.rb' unless file_name =~ /\.rb/
   @@recent = file_name
   load "#{file_name}"
end

def rl
  fl(@@recent)
end
