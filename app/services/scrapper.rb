require 'nokogiri'
require 'open-uri'
require 'pry'
require 'csv'

class Scraper
  def recipes
    base_url = 'https://www.lesrecettesdecuisine.com/'
    main_url = "#{base_url}recette-de-cuisine/category/les-desserts"
    data_recipes = data_scraper(main_url)
    recipe_array = []
    array_url_img = []
    array_name = []
    array_category = []
    array_resum = []

    p 'NOMS DES RECETTES'
    data_recipes.css('.post .post-entry-content > h3 > a').each do |t|
      array_name << t.text
    end

    p 'URL DES IMAGES'
    data_recipes.css('.post .post-thumbnail > a img').each do |object|
      if object.css('.post-thumbnail > a img') == nil
        array_url_img << "pas d'image"
        p array_url_img
      else
        array_url_img << object.attr('data-src')
      end
    end
    p array_url_img.count


    p 'CATEGORIES'
    data_recipes.css('.post-entry-content > .entry-meta > .category-link > a').each do |t|
      array_category << t.text if t.text != 'Vos Recettes'
    end
    p array_category.count

    p 'RESUME DES RECETTES'
    data_recipes.css('.entry-excerpt > p').each do |t|
      array_resum << t.text
    end
    p array_resum.count


    p recipe_array
  end

  def data_scraper(url)
    html = URI.open(url)
    doc  = Nokogiri::HTML(html)
  end

end

scrape = Scraper.new
scrape.recipes


    # CSV.foreach("/Users/ericchomette/code/revision/Cooklist/CookPlan/db/recipe.csv") do |row|
    # end

    # p "NOMS DES RECETTES"
    # recipe_name = data_recipes.css('.post-entry-content > h3 > a').each do |t|
    #  array_name << t.text
    # end
    # p array_name.count

    # p "URL DES IMAGES"
    # url_img = data_recipes.css('.post-thumbnail > a img').each do |object|
    #   array_url_img << object.attr('data-src')
    # end
    # p array_url_img.count

    # p "CATEGORIES"
    # recipes_content_category = data_recipes.css('.post-entry-content > .entry-meta > .category-link > a').each do |t|
    #   array_category << t.text if t.text != "Vos Recettes"
    # end
    # p array_category.count

    # p "RESUME DES RECETTES"
    # recipes_content_category = data_recipes.css('.entry-excerpt > p').each do |t|
    #   array_resum << t.text
    # end
    # p array_resum.count

    # p 'URL DES IMAGES'
    # data_recipes.css('.post .post-thumbnail > a img').each do |object|
    #   if object.attr('data-src') == nil && data_recipes.css('.post .post-entry-content > h3 > a').exist
    #     array_url_img << "pas d'image"
    #     p array_url_img
    #   else
    #     array_url_img << object.attr('data-src')
    #   end
    # end
    # p array_url_img.count

    # cp = []
    # data_recipes.css('.post').each do |post|
    #   cp << post.text
    # end


       # array_name.each_with_index do |t, index|
    #   recipe_array << [array_name[index], array_category[index], array_resum[index], array_url_img[index]]
    # end
