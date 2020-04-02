class WordsController < ApplicationController

  before_action :set_user

  def index
    @word = Word.new
    @words = @user.words
  end
  
  def create
    Word.create(word_params)
    redirect_to root_path
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update

    if @randoms.update(word_params_score)
      if @randoms[0].succeed == 1
        @randoms[0].score += 1
      end
      redirect_to root_path
    end
    # @word = Word.find(params[:id])
    # @words = Word.where(user_id: params[:id])
    # if @word.update(word_params)
    #   redirect_to root_path
    # elsif @words.update(word_params)
    #   redirect_to root_path
    # else
    #   render :edit
    # end
  end

  def destroy
    @word = Word.find(params[:id])
    if @word.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  def gacha
  end

  def random3
    @randoms = Word.where(user_id: params[:id]).order("RAND()").limit(3)
    @random = Word.new
    @user = User.find(current_user.id)
    # binding.pry
  end

  def random5
    @randoms = Word.where(user_id: params[:id]).order("RAND()").limit(5)
    @random = Word.new
  end

  def random10
    @randoms = Word.where(user_id: params[:id]).order("RAND()").limit(10)
    @random = Word.new
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def word_params
    params.require(:word).permit(:name, :mean, :score, :succeed).merge(user_id: current_user.id)
  end

  def word_params_score
    params.require(:word).permit(:succeed,:score)
  end
end
