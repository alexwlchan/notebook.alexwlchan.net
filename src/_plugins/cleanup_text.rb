# Various text cleanups.

module Jekyll
  module CleanupsFilter
    def cleanup_text(input)
      # Replace mentions of RFCs with a non-breaking space version.
      text = input.gsub(/RFC (\d+)/, 'RFC&nbsp;\1')

      # Also: "part X" or "Part X"
      text = text.gsub(/([Pp]art) (\d+)/, '\1&nbsp;\2')

      # Display "LaTeX" in a nice way, if you have CSS enabled
      text = text.gsub(
        "LaTeX",
        "<span class=\"latex\">L<sup>a</sup>T<sub>e</sub>X</span>")

      # Replace any mention of "PyCon" with the appropriate non-breaking space
      text = text.gsub("PyCon ", "PyCon&nbsp;")

      # Get rid of the trailing space after the dollar in language-console
      # blocks.  The space is added in CSS and is unselectable.
      text = text.gsub(
        "<span class=\"w\">$ </span>",
        "<span class=\"w\">$</span>")

      text
    end
  end
end

Liquid::Template::register_filter(Jekyll::CleanupsFilter)
