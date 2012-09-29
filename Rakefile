FILES = %w(bash_profile bashrc gitconfig gitignore pryrc tmux.conf zshrc)
OPTS  = {force: :boolean, verbose: :boolean, noop: :boolean}

require 'fileutils'
include FileUtils

options = {}

desc 'Symlink dotfiles in home directory'
task :install do
  begin
    each_dotfile do |src, dest|
      mv dest, "#{dest}.backup" if File.exist?(dest) && !File.symlink?(dest)
      symlink src, dest, options rescue nil
    end
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

desc 'Create gitconfig'
task :gitconfig do
  gitconfig_path = '%s/.gitconfig' % ENV['HOME']
  if !File.exist?(gitconfig_path) || ENV['FORCE_GITCONFIG']
    require 'erb'
    File.open gitconfig_path, 'w' do |f|
      f.write ERB.new(File.read 'gitconfig.erb').result
    end
  end
end

def setup_emacsd
  if File.exist?('~/emacs')
    symlink File.expand_path('~/emacs'), File.expand_path('~/.emacs.d') rescue nil
  end
end

def each_dotfile(&block)
  FILES.each do |file|
    block.call File.expand_path(file), File.expand_path("~/.#{file}")
  end
end
