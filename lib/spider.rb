require 'mechanize'
require_relative 'page'

class Spider
  attr_reader :scrapper

  def crawl(initial_url)
    2.times do
      begin
      raw_page = scrapper.get(initial_url)
      page = Page.new(raw_page)
      link = page.random_external_link
      p link
      crawl(link)
      rescue => e
        print e
      end
    end
  end

  def initialize
    @scrapper = Mechanize.new
  end
end
