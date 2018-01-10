class Page
  def initialize(raw_page)
    @raw_page = raw_page
  end

  def uri
    @raw_page.uri.to_s
  end

  def domain_name
    uri.match(/((:\/+w+\.)|\/+)([^.]+)\./).to_a.last
  end

  def title
    @raw_page.title
  end

  def all_links
    @raw_page.links.map(&:href)
  end

  def external_links
    all_links.select { |link| link.include?'http' }
  end

  def random_external_link
    external_links.sample
  end
end
