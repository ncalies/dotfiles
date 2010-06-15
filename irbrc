# print local methods
class Object

    def local_methods
        (methods - Object.instance_methods).sort
    end

end

alias q exit

require 'rubygems'
require 'pp'
require 'irb/completion'

def load_lib(lib)
    begin
        require lib
        yield if block_given?
    rescue LoadError => e
        warn "Cannot load #{lib}: #{e}"
    end
end

%w(interactive_editor ap).each{ |l| load_lib l }
load_lib 'wirble' do
    Wirble.init
    Wirble.colorize
end
load_lib 'boson'    do Boson.start end
load_lib 'hirb'     do extend Hirb::Console end
#load_lib 'bond'     do Bond.start end

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
