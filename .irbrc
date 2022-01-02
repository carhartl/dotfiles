require 'rubygems'
require 'irb'
require 'irb/completion'
require 'irb/ext/save-history'

alias e exit

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT] = true

class Object
  def interesting_methods
    case self.class
    when Class
      self.public_methods.sort - Object.public_methods
    when Module
      self.public_methods.sort - Module.public_methods
    else
      self.public_methods.sort - Object.new.public_methods
    end
  end

  # list methods which aren't in superclass
  def local_methods(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
  end

  # print documentation
  #
  #   ri 'Array#pop'
  #   Array.ri
  #   Array.ri :pop
  #   arr.ri :pop
  def ri(method = nil)
    unless method && method =~ /^[A-Z]/ # if class isn't specified
      klass = self.kind_of?(Class) ? name : self.class.name
      method = [klass, method].compact.join('#')
    end
    puts `ri '#{method}'`
  end
end

# Hirb
begin
  # load hirb
  require 'hirb'

  # start hirb
  Hirb.enable
rescue LoadError => err
  warn "Couldn't load Hirb: #{err}"
end

def copy(str)
  IO.popen('pbcopy', 'w') { |f| f << str.to_s }
end

def paste
  `pbpaste`
end

# Load a local irbrc
# http://www.samuelmullen.com/2010/04/irb-global-local-irbrc/
def load_irbrc(path)
  return if (path == ENV["HOME"]) || (path == '/')

  load_irbrc(File.dirname path)

  irbrc = File.join(path, ".irbrc")

  load irbrc if File.exists?(irbrc)
end

load_irbrc Dir.pwd
