require 'nokogiri'
require 'open-uri'
require 'pry'
require 'csv'

class Scraper

  def scrape_recipe_urls
    url = "https://www.lesrecettesdecuisine.com/liste-recettes-cuisine-html"
    html = URI.open(url)
    doc  = Nokogiri::HTML(html)
    recipes = doc.css('.post').css('.entry-title')
    binding.pry
  end

end
  scrape = Scraper.new
  scrape.scrape_city_urls
