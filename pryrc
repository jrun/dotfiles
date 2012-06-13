prompt = proc do |_, level, pry|
  tree = pry.binding_stack.map { |b| Pry.view_clip(b.eval 'self') }.join ' / '
  "#{level}[#{pry.input_array.size}] #{tree}> "
end

Pry.config.prompt = [prompt, prompt]

# Is this a Rails < 3.0 app?
if File.exist? "#{Dir.pwd}/script/runner"
  require './config/environment'
  require 'console_app'
  require 'console_with_helpers'
end

# Settings for better inf-ruby support.
# Pry.pager = false
# Pry.prompt[1] = proc {""}
