class WordsController < ApplicationController

  before_action :set_user

  def index
    @word = Word.new
    @words = @user.words
    @random = Word.order("RAND()").limit(10)
  end

  def create
    Word.create(word_params)
    redirect_to root_path
  end

  def updata
    Word.update(word_params_score)
    redirect_to root_path
  end

  def random
    @random = Word.order("RAND()").limit(10)
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def word_params
    params.require(:word).permit(:name, :mean, :score).merge(user_id: current_user.id)
  end

  def word_params_score
    params.require(:word).permit(:score)
  end
end
