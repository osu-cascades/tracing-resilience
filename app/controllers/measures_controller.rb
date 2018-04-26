class MeasuresController < ApplicationController
  before_action :set_measure, only: [:show, :edit, :update, :destroy]

  def index
    @measures = Measure.all
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
    redirect_to current_user
    flash[:success] = 'Measure was successfully destroyed.'
  end

  private
    def set_measure
      @measure = Measure.find(params[:id])
    end

    def measure_params
      params.fetch(:measure, {})
    end
end
