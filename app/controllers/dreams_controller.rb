class DreamsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  # トップページ
  def top; end

  # 新規投稿のための箱
  def new
    @dream = Dream.new
  end

  # 新規投稿の作成
  def create
    @dream = Dream.new(dream_params)
    @dream.user_id = current_user.id
    if @dream.save
      redirect_to dream_path(@dream.id)
    else
      render :new
    end
  end

  # 投稿一覧ページ（ページャ追加）
  def index
    @dreams = Dream.all.page(params[:page]).per(10)
  end

  # 投稿の詳細ページ
  def show
    @dream = Dream.find(params[:id])
    @user = @dream.user
    @comment = Comment.new
  end

  # 投稿の編集ページ
  def edit
    @dream = Dream.find(params[:id])
    @user = @dream.user
    # 投稿者でなければ一覧画面へリダイレクト
    redirect_to dreams_path if @dream.user != current_user
  end

  # 投稿内容の更新
  def update
    @dream = Dream.find(params[:id])
    if @dream.update(dream_params)
      redirect_to dream_path(@dream.id)
    else
      @dream = dream
      render :edit
    end
  end

  # 投稿の削除
  def destroy
    @dream = Dream.find(params[:id])
    @dream.destroy
    redirect_to dreams_path
  end

  # 投稿の検索ページ
  def search
    @dreams = if params[:title].present?
                # 投稿のタイトルと部分一致する投稿を検索
                Dream.where('title LIKE ?', "%#{params[:title]}%").page(params[:page]).per(10)
              else
                Dream.none.page(params[:page]).per(10)
              end
  end

  private

  def dream_params
    params.require(:dream).permit(:user_id, :day, :emotion, :title, :body, :start_time)
  end
end
