require 'nokogiri'
require 'open-uri'
require 'pry'
require 'csv'

class Scraper

  def recipes
    recipe_array = [img, name, category, resume]

    base_url = "https://www.lesrecettesdecuisine.com/"
    main_url = "#{base_url}recette-de-cuisine/category/les-desserts"
    # The open method take the url, and return and html file
    data_recipes = data_scraper(main_url)

    p "URL DES IMAGES"
    url_img = data_recipes.css('.post-thumbnail > a img').each do |object|
      p object.attr('data-src')
    end

    p "NOMS DES RECETTES"
    recipe_name = data_recipes.css('.post-entry-content > h3 > a').each do |t|
      p "- #{t.text}"
    end

    p "CATEGORIES"
    recipes_content_category = data_recipes.css('.post-entry-content > .entry-meta > .category-link > a').each do |t|
      p "- #{t.text}" if t.text != "Vos Recettes"
    end

    p "RESUME DES RECETTES"
    recipes_content_category = data_recipes.css('.entry-excerpt > p').each do |t|
      p "- #{t.text}"
    end
  end

  def data_scraper(url)
    html = URI.open(url)
    doc  = Nokogiri::HTML(html)
  end

end

scrape = Scraper.new
scrape.recipes
