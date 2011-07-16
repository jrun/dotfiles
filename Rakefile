

FILES = %w(bash_profile bashrc gitignore irbrc tmux.conf railsrc zlogin zshrc)
OPTS  = {:force => :boolean, :verbose => :boolean, :noop => :boolean}

options = {}

desc 'Symlink dotfiles in home directory'
task :install do
  begin
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

def setup_emacsd
  symlink File.expand_path('~/emacs'), File.expand_path('~/.emacs.d')
end

def each_dotfile(&block)
  FILES.each do |file|
    block.call File.expand_path(file), File.expand_path("~/.#{file}")
  end
end
