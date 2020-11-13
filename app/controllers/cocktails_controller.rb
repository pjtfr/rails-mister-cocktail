class CocktailsController < ApplicationController
  # before_action :set_cocktail, only: [:show, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @review = Review.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end

# Create
get    'songs/new',      to: 'songs#new'
post   'songs',          to: 'songs#create'

# Read
get    'songs',          to: 'songs#index'
get    'songs/:id'       to: 'songs#show', as: 'song'

# Update
get    'songs/:id/edit', to: 'songs#edit'
patch  'songs/:id',      to: 'songs#update'

# Destroy
delete 'songs/:id',      to: 'songs#destroy'
