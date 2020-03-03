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
    @word = Word.find(params[:id])
    if @word.update(word_params)
      redirect_to root_path
    else
      render :edit
    end
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
    @randoms = Word.order("RAND()").limit(3)
    @random = Word.new
    if params[:submit]
      @random.score += 1
    elsif params[:btn2]
      @random.score -= 1
    end
  end

  def random5
    @randoms = Word.order("RAND()").limit(5)
    @random = Word.new
  end

  def random10
    @randoms = Word.order("RAND()").limit(10)
    @random = Word.new
    if params[:btn1]
      @random.score += 1
    elsif params[:btn2]
      @random.score -= 1
    end
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
