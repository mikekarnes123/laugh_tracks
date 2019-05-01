class ComediansController < ApplicationController

  def index
    if params[:age]
      @comedians = Comedian.where(age: params[:age])
    elsif params[:age] == nil
      @comedians = Comedian.all
    end
  end

  def new
    @comedian = Comedian.new
  end

  def create
    Comedian.create(comedian_params)
    redirect_to comedians_path
  end

  private

  def comedian_params
    params.require(:comedian).permit(:name, :thumbnail, :age, :city)
  end
end
