class RecipeIngredient

  @@all = []

  attr_accessor :ingredient, :recipe

  def initialize(recipe_name)
    @@all << self
    @recipe = recipe_name
  end

  def self.all
    @@all
  end

end
