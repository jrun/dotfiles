FILES = %w(bash_profile bashrc gitconfig gitignore pryrc tmux.conf zshrc)
OPTS  = {:force => :boolean, :verbose => :boolean, :noop => :boolean}

options = {}

desc 'Symlink dotfiles in home directory'
task :install do
  begin
    render_gitconfig
    each_dotfile {|src, dest| symlink src, dest, options rescue nil}
    setup_emacsd
  rescue => err
    puts err.message
  end
end

desc 'Remove dotfile symlinks.'
task :clean do
  begin
    each_dotfile {|src, dest| rm dest, options rescue nil}
  rescue => err
    puts err.message
  end
end

def render_gitconfig
  if !File.exist?('gitconfig') || ENV['FORCE_GITCONFIG']
    require 'erb'
    File.open('gitconfig', 'w') do |f|
      f.write ERB.new(File.read('gitconfig.erb')).result
    end
  end
end

def setup_emacsd
  symlink File.expand_path('~/emacs'), File.expand_path('~/.emacs.d') rescue nil
end

def each_dotfile(&block)
  FILES.each do |file|
    block.call File.expand_path(file), File.expand_path("~/.#{file}")
  end
end
