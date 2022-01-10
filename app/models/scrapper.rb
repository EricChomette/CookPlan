require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def recipes
    base_url = "https://www.lesrecettesdecuisine.com/"
    main_url = "#{base_url}recette-de-cuisine/category/les-desserts"
    # The open method take the url, and return and html file
    data_recipes = data_scraper(main_url)

    p recipes_img = data_recipes.css('.post-thumbnail')
    p recipes_content = data_recipes.css('.post-entry-content')
  end

  def data_scraper(url)
    html = URI.open(url)
    doc  = Nokogiri::HTML(html)
  end

end

# class selector image -> post-thumbnail
# class selector text -> post-entry-content

scrape = Scraper.new
scrape.recipes
