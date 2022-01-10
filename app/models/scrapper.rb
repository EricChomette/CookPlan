require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def recipes
    base_url = "https://www.lesrecettesdecuisine.com/"
    main_url = "https://www.lesrecettesdecuisine.com/recette-de-cuisine/category/les-desserts"
    # The open method take the url, and return and html file
    data = data_scraper(main_url)
    recipes = doc.css('.articles-list').css('.post-entry-content')
    p recipes
    binding.pry
    end

    def data_scraper(url)
      html = URI.open(url)
      doc  = Nokogiri::HTML(html)
    end
end

# class selector image -> post-thumbnail
# class selector text -> post-entry-content

scrape = Scraper.new
scrape.scrape_recipe_url
