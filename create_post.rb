#!/usr/bin/env ruby

require "fileutils"

now = Time.now

unless ARGV.length == 1
  puts "Usage: create_post.rb <TITLE>"
  exit 1
end

title = ARGV[0]
name = title.downcase.gsub(/[^a-z]/, "-").gsub(/\-{2,}/, "-")
path = File.join(
  "src",
  "_posts",
  now.strftime("%Y"),
  "#{now.strftime('%Y-%m-%d')}-#{name}.md"
)

if File.exist? path
  puts path
  exit 0
end

doc = "---\nlayout: post\ntitle: #{title}\ndate: #{now}\ntags:\n---\n\n"
File.open(path, 'w') { |f| f.write(doc) }

puts path
