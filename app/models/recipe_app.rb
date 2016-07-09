require 'open-uri'

class RecipeApp < ActiveRecord::Base
  validates :page, numericality: {only_integer: true}

  def self.api_records(page, dish, ingredients)
    search = "?i=#{ingredients}&q=#{dish}&p=#{page}"
    Puppy(search)
    @return_hash["results"]
  end

  def self.Puppy(search)
    uri = 'http://www.recipepuppy.com/api/'
    @url = "#{uri}#{search}"
    @api_json = open(@url, :read_timeout => 10).read
    @return_hash = JSON.parse(@api_json)
  end

  def self.cleaner(day)
    RecipeApp.find_each do |recipe|
      unless recipe.created_at.to_s.slice(5,2) == day
        recipe.destroy
      end
    end
  end

end
