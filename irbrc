# print local methods
class Object

  def local_methods
    (methods - Object.instance_methods).sort
  end
  alias u local_methods

end

alias q exit

require 'rubygems'
require 'pp'
require 'irb/completion'

def load_lib(lib)
  gem = lib
  if lib.respond_to?(:keys)
    gem = lib.keys.first
    lib = lib[gem]
  end
  begin
    require lib
    yield if block_given?
  rescue LoadError => e
    warn "Cannot load #{lib}: #{e}"
    puts "Do you want to install #{gem}? [y/n]"
    if gets.chomp =~ /y/i
      %x{gem install #{gem} --no-rdoc --no-ri}
      Gem.refresh
      retry
    end
  end
end

load_lib 'interactive_editor'
load_lib({ 'awesome_print' => 'ap' })
load_lib 'wirble' do
  Wirble.init
  Wirble.colorize
  colors = Wirble::Colorize.colors.merge({
    :object_class => :purple,
    :symbol => :purple,
    :symbol_prefix => :purple
  })
  Wirble::Colorize.colors = colors
end
load_lib 'hirb' do
  extend Hirb::Console
end
#load_lib 'bond' do
  #Bond.start
#end

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
