#!/usr/bin/env ruby

require "fileutils"

now = Time.now

unless ARGV.length == 1
  puts "Usage: create_post.rb <TITLE>"
  exit 1
end

title = ARGV[0]
name = title
  .downcase
  .gsub(/[^a-z]/, "-")
  .gsub(/\-{2,}/, "-")
  .chomp("-")

out_dir = File.join("src", "_posts", now.strftime("%Y"))
FileUtils.mkdir_p out_dir

path = File.join(out_dir, "#{now.strftime('%Y-%m-%d')}-#{name}.md")

def finish(path)
  puts path
  `open #{path}`
  exit 0
end

if File.exist? path
  finish(path)
end

doc = "---\nlayout: post\ntitle: #{title}\ndate: #{now}\ntags:\n---\n\n"
File.open(path, 'w') { |f| f.write(doc) }

finish(path)
