class AnimalsController < ApplicationController
  CATEGORIES = %w[All Mammals Birds Reptiles Fish Insects].freeze

  def index
    @categories = CATEGORIES
    @selected = params[:category].presence || 'All'
    @animals = if @selected == 'All'
      Animal.order(:name)
    else
      Animal.where(category: @selected).order(:name)
    end
  end
end
