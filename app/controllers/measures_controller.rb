class MeasuresController < ApplicationController
  before_action :set_measure, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @measures = Measure.all
  end

  def general
    @general_measure = Measure.where(category: :general)
  end

  def individual
    @individual_measure = Measure.where(category: :individual)
  end

  def relational
    @relational_measure = Measure.where(category: :relational)
  end

  def community
    @community_measure = Measure.where(category: :community_measure)
  end

  def show; end

  def new
    @measure = Measure.new
  end

  def edit; end

  def create
    @measure = Measure.new(measure_params)

    if @measure.save
      redirect_to @measure
      flash[:success] = 'Measure was successfully created.'
    else
      render :new
      end
  end

  def update
    if @measure.update(measure_params)
      redirect_to @measure
      flash[:success] = 'Measure was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @measure.destroy
    redirect_to measures_path
    flash[:success] = 'Measure was successfully destroyed.'
  end

  private
    def set_measure
      @measure = Measure.find(params[:id])
    end

    def measure_params
      params.require(:measure).permit(:title, :category, :document)
    end
end
