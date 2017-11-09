class User
  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def add_recipe_card(recipe, date = Time.now, rating)
    RecipeCard.new(self, recipe, date, rating)
  end

  def recipes
    #binding.pry
    recipes = RecipeCard.all.select{|x| x.user == self}
    recipes.collect{|x| x.recipe}
  end
end
