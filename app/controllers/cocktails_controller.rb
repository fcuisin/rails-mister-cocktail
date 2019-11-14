class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :create]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(params_cocktail)
    if @cocktail.save
      redirect_to cocktails_path
    else
      render :new
    end
  end

  private

  def set_cocktail
    @cocktail = @cocktails.find(params[:id])
  end

  def params_cocktail
    params.require(:cocktail).permit(:name)
  end
end
