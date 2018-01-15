require 'mechanize'
require_relative 'page'

class Spider
  attr_reader :scrapper, :scrapped_page

  def initialize
    @scrapped_page = nil
  end

  def crawl(link='https://www.bbc.co.uk', itiration=0)
    begin
    p "crawling #{link}.."
    @scrapped_page = scrapper.get(link)
    p "done"
    if itiration > 0
      p itiration
      new_link = Page.new(scrapped_page).random_external_link
      crawl(new_link, itiration - 1)
    end
    rescue => e
      print e
    end
  end

  def initialize
    @scrapper = Mechanize.new
  end
end
