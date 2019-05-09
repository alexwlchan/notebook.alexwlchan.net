require "net/http"

module Jekyll
  class GitHubTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      repo, @issue_number = text.strip.split("#")
      @owner, @repo = repo.split("/")
    end

    def cache_file()
      "#{@src}/_github.json"
    end

    def render(context)
      site = context.registers[:site]
      @src = site.config["source"]

      if File.exists? cache_file()
        github_data = JSON.parse(File.read(cache_file()))
      else
        github_data = {}
      end

      identifier = "#{@owner}/#{@repo}##{@issue_number}"

      if !github_data.key?(identifier)
        uri = URI("https://api.github.com/repos/#{@owner}/#{@repo}/issues/#{@issue_number}")

        req = Net::HTTP::Get.new(uri)
        req["Accept"] = "application/vnd.github.v3+json"
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = (uri.scheme == "https")

        resp = http.request(req)

        title = JSON.parse(resp.body)["title"]

        github_data[identifier] = {
          "title" => title
        }

        json_string = JSON.pretty_generate(github_data)
        File.open(cache_file(), "w") { |f| f.write(json_string) }
      end

      issue_data = github_data[identifier]

      "<a href=\"https://github.com/#{@owner}/#{@repo}/issues/#{@issue_number}\">#{identifier}</a> &ndash; #{issue_data['title']}"
    end
  end
end

Liquid::Template.register_tag('github_issue', Jekyll::GitHubTag)
