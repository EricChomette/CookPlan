require 'nokogiri'
require 'open-uri'
require 'pry'
require 'csv'

class Scraper

  def scrape_recipe_urls
    url = "https://www.lesrecettesdecuisine.com/liste-recettes-cuisine-html"
    html = URI.open(url)
    doc  = Nokogiri::HTML(html)
    recipes = doc.css('.post').css('.entry-title').css('a')
    recipe_urls = []
    recipes.each do |recipe|
      recipe_url = recipe.attribute('href').value
      recipe_urls << recipe_url
    end
    scrape_recipe_pages(recipe_urls)
  end

  def scrape_recipe_pages(recipe_urls)
    recipe_urls.each do |recipe_url|
      html = URI.open(recipe_url)
      doc  = Nokogiri::HTML(html)
      binding.pry
    end
  end
end

scrape = Scraper.new
scrape.scrape_recipe_urls
