class LaptopsController < ApplicationController
  before_action :set_laptop, only: [:show, :update, :destroy]

  # GET /laptops
  def index
    @laptops = Laptop.all

    render json: @laptops
  end

  # GET /laptops/1
  def show
    render json: @laptop
  end

  # POST /laptops
  def create
    @laptop = Laptop.new(laptop_params)

    if @laptop.save
      render json: @laptop, status: :created, location: @laptop
    else
      render json: @laptop.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /laptops/1
  def update
    if @laptop.update(laptop_params)
      render json: @laptop
    else
      render json: @laptop.errors, status: :unprocessable_entity
    end
  end

  # DELETE /laptops/1
  def destroy
    @laptop.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_laptop
      @laptop = Laptop.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def laptop_params
      params.require(:laptop).permit(:name, :condition, :price)
    end
end
