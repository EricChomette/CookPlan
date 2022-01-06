require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  def scrape_recipe_url
    url_recipes = "https://www.lesrecettesdecuisine.com/liste-recettes-cuisine-html"

    # The open method take the url, and return and html file
    html = URI.open(url_recipes)
    doc  = Nokogiri::HTML(html)
    recipes = doc.css('.articles-list').css('.post-entry-content')
    p recipes
    binding.pry
    end
end

scrape = Scraper.new
scrape.scrape_recipe_url
