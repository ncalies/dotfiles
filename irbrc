#require 'rubygems'
require 'pp'
require 'irb/completion'
#require 'ap'


=begin
    require 'wirble'
    Wirble.init
    Wirble.colorize
rescue LoadError => e
    warn "Cannot load wirble: #{e}"
end

begin
    require 'boson'
    Boson.start
rescue LoadError => e
    warn "Cannot load boson: #{e}"
end
=begin
    require 'hirb'
    extend Hirb::Console
rescue LoadError => e
    warn "Cannot load Hirb: #{e}"
=end

IRB.conf[:USE_READLINE] = true
IRB.conf[:PROMPT_MODE]  = :SIMPLE

IRB.conf[:AUTO_INDENT]  = true

require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

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
