class Dotfiles < Thor
  include FileUtils

  FILES = %w(bash_profile bashrc gitignore irbrc tmux.conf railsrc zlogin zshrc)
  OPTS  = {:force => :boolean, :verbose => :boolean, :noop => :boolean}

  desc 'install', 'Symlink dotfiles in home directory'
  method_options OPTS
  def install
    each_dotfile {|src, dest| symlink src, dest, options rescue nil}
  rescue => err
    puts err.message
  end

  desc 'clean', 'Remove dotfile symlinks.'
  method_options OPTS
  def clean
    each_dotfile {|src, dest| rm dest, options rescue nil}
  rescue => err
    puts err.message
  end

  private
  def each_dotfile(&block)
    FILES.each do |file|
      block.call File.expand_path(file), File.expand_path("~/.#{file}")
    end
  end
end
