require 'rubygems'
require 'open3'

ignore = %w(Rakefile README.md .gitignore compiz.conf mustang.vim)

desc "Install your dotfiles."
task :install do
  Dir.glob(File.join(Dir.pwd, '*')).each do |file|
    unless ignore.include?(File.basename file)
      FileUtils::Verbose.ln_s(file, File.join(File.expand_path("~"), ".#{File.basename(file)}")) rescue nil
    end
  end
end


desc "Uninstall your dotfiles."
task :uninstall do
  Dir.glob(File.join(Dir.pwd, '*')).each do |file|
    # Diff the File and make sure we're not unlinking a file
    # that we didn't put there, or that doesn't match the ones
    # in this directory
    filename = File.expand_path("~/.#{File.basename(file)}")
    if ignore.include?(File.basename(file)) # diff is True if there's a difference
      if File.exists?(filename) and system("diff #{file} #{filename} 1>/dev/null")
        puts "Skipped Removing #{filename}, it differs from #{file} or it is in the ignore list"
        next
      else
        next
      end
    end
    FileUtils::Verbose.rm(filename) if File.exists?(filename)
  end
end

desc "Update your dotfiles"
task :update do
  if system('git pull')
    puts "Updated OK, Installing..."
    if Rake::Task['uninstall'].execute && Rake::Task['install'].execute
      puts "Sucessfully Installed"
    end
  end
end

desc "Reinstall your dotfiles."
task :reinstall do
  Rake::Task['uninstall'].execute
  Rake::Task['install'].execute
end

desc "Install any color schemes"
task :install_colors do
    colors_path = File.join(File.expand_path("~"), ".vim", "colors")
    unless File.directory?(colors_path)
        puts "creating #{colors_path}"
        Dir.mkdir(colors_path)
    end
    FileUtils::Verbose.ln_s(File.join(Dir.pwd, 'mustang.vim'), File.join(File.expand_path("~"), ".vim", "colors", 'mustang.vim'))
end
