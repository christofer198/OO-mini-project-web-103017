class Recipe

  attr_reader :id, :recipe_name

  @@id = 0

  @@all = []

  def initialize(name)
      @recipe_name = name
      @id = @@id+1
      @@id = @id
      @@all << self

  end

  def users
    #RecipeCard has an instance of recipe associated to it
    #binding.pry
    users = []
    RecipeCard.all.each{|x| users<<x.user if x.recipe.id == self.id}
    users
  end

  def add_ingredients(ingredients)
    ingredients.each do |x|
      recipe = RecipeIngredient.new(self)
      recipe.ingredient = x
    end
  end

  def ingredients
    RecipeIngredient.all.select{|x| x.recipe == @recipe_name}
  end

  def self.all
    @@all
  end

  def self.most_popular
    #binding.pry
    recipe_ids = []
    freq_hash = {}
    RecipeCard.all.each{|x| recipe_ids << x.recipe.id}
    recipe_ids.each{|x| freq_hash[x] = 0}
    recipe_ids.each{|x| freq_hash[x] += 1}
    most_popular = freq_hash.max_by{|k,v| v}[0]
    RecipeCard.all.select{|x| x.recipe.id == most_popular}
  end

end
