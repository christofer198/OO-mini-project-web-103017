class RecipeCard

  @@all = []

  attr_accessor :rating, :recipe, :user, :date


  def initialize(user, recipe, date, rating)
    # binding.pry
    @date = date
    @rating = rating
    @recipe = recipe
    @user = user
    @@all << self
  end

  def self.all
    @@all
  end
end
