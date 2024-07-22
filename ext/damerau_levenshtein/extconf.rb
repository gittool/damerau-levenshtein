# frozen_string_literal: true

# Loads mkmf which is used to make makefiles for Ruby extensions
require "mkmf"
require 'fileutils'

# The destination
dir_config("damerau-levenshtein/damerau_levenshtein")

# Do the work
create_makefile("damerau-levenshtein/damerau_levenshtein")

# Determine the path to the 'lib' directory of your gem
gem_lib_dir = File.expand_path('../../../lib/damerau-levenshtein', __FILE__)

# Path to the .so file
so_file = File.join(File.dirname(__FILE__), 'damerau_levenshtein.so')

if File.exist?(so_file)
  # At program exit, copy the 'damerau_levenshtein.so' file to the gem's 'lib' directory
  at_exit do
    # Combine the current directory of this file and the 'damerau_levenshtein.so' file, then copy it to the gem's 'lib' directory
    FileUtils.cp(so_file, gem_lib_dir)
  end
else
  puts "Error: The 'damerau_levenshtein.so' file was not generated."
end
