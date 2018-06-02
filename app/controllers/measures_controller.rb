class MeasuresController < ApplicationController

  before_action :authenticate_user!
  before_action :require_admin, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_measure, only: [:show, :edit, :update, :destroy]

  def index
    @measures = Measure.all
  end

  def general
    @measures = Measure.where(category: :general)
    @measure_count = @measures.size
  end

  def individual
    @measures = Measure.where(category: :individual)
    @measure_count = @measures.size
  end

  def relational
    @measures = Measure.where(category: :relational)
    @measure_count = @measures.size
  end

  def community
    @measures = Measure.where(category: :community)
    @measure_count = @measures.size
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
