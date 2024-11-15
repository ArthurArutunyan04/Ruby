class HTML_tree
  attr_accessor :root

  def initialize(file_path)
    html_content = File.read(file_path)
    self.root = self.parse_html(html_content)
  end

  def parse_html(html)
    stack = []
    self.root = nil

    html.scan(/<([^>]+)>|([^<]+)(?=<|$)/) do |tag_match, content_match|
      if tag_match
        process_tag(tag_match.strip, stack)
      elsif content_match
        process_content(content_match.strip, stack.last)
      end
    end

    self.root
  end

  def process_tag(tag_match, stack)
    if tag_match.start_with?('/')
      stack.pop
    else
      handle_opening_tag(tag_match, stack)
    end
  end

  def handle_opening_tag(tag_match, stack)
    parts = tag_match.split
    tag_name = parts[0]
    tag = Tag.new(tag_name)

    if parts.size > 1
      attributes = parts[1..-1]
      parse_attributes(attributes, tag)
    end

    if stack.empty?
      self.root = tag
    else
      stack.last.add_child(tag)
    end

    stack.push(tag)
  end

  def parse_attributes(attributes, tag)
    attributes.each do |attribute|
      key_value = attribute.split('=')
      key = key_value[0]
      value = key_value[1] ? key_value[1].tr('"', '') : nil
      tag.attributes[key] = value if key && value
    end
  end

  def process_content(content_match, current_tag)
    if current_tag
      cleaned_content = content_match.strip
      current_tag.content = cleaned_content unless cleaned_content.empty?
    end
  end

  def to_s(tag = self.root)
    result = tag.to_s + "\n"
    tag.children.each do |child|
      result += to_s(child)
    end
    result
  end
end