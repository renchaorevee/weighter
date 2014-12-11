class RecordsController < ApplicationController

  def new
    @record = Record.new
  end

  def create
    @record = current_user.records.create(record_params)

    if @record.save
      redirect_to @record
    else
      render 'new'
    end
  end

  def show
    @record = current_user.records.find(params[:id])
  end

  def index
    @records = current_user.records.all
  end

  def edit
    @record = current_user.records.find(params[:id])
  end

  def update
    @record = current_user.records.find(params[:id])

    if @record.update(record_params)
      redirect_to @record
    else
      render 'edit'
    end
  end

  private

  def record_params
      params.require(:record).permit(:weight, :date, :id)
  end
end
