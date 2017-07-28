class EslClassesController < ApplicationController
  def show
    @esl_class = EslClass.find(params[:id])
  end

  def index

  end
end
