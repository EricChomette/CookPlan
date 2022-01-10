require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def recipes
    # [img_recipe, recipe_name , category, resum  ]

    base_url = "https://www.lesrecettesdecuisine.com/"
    main_url = "#{base_url}recette-de-cuisine/category/les-desserts"
    # The open method take the url, and return and html file
    data_recipes = data_scraper(main_url)

    # # image lien
    # p "Image de la recette"
    # recipes_content = data_recipes.css('.post-thumbnail > a img').each do |object|
    #   p object.attr('data-src')
    # end

    # p "Titre des recette"
    # p recipes_content = data_recipes.css('.post-entry-content > h3 > a').text
    # # category
    p "Catergory de la recette"
    recipes_content_category = data_recipes.css('.post-entry-content > .entry-meta > .category-link > a').each do |t|
      p t.text if t.text != "Vos Recettes"
    end

    # résumé de la recette
    # p "Résumé de la recette"
    # p recipes_content_category = data_recipes.css('.entry-excerpt > p').text
  end

  def data_scraper(url)
    html = URI.open(url)
    doc  = Nokogiri::HTML(html)
  end

end

scrape = Scraper.new
scrape.recipes

# class selector image -> post-thumbnail
# class selector text -> post-entry-content
