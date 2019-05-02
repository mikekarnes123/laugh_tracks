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
    @comedian = Comedian.new(comedian_params)
    if @comedian.save
      redirect_to comedians_path
      return
    end
    redirect_to new_comedian_path
  end

  private

  def comedian_params
    params.require(:comedian).permit(:name, :thumbnail, :age, :city)
  end
end
