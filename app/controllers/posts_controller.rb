class PostsController < ApplicationController

  def index 
  @posts = Post.all.order(id: "DESC")
  end


  def create
  post = Post.create(content: params[:content], checked: false)
  render json: {post: post}
  #postにpostが入っている renderのjsonオプション

  end

  def checked

    post = Post.find(params[:id])
    if post.checked
      # 条件式はtrueの場合
      post.update(checked: false)
      # 既読を解除する
    else
      post.update(checked: true)
      # 既読にする
    end
#binding.pryを使ってpost[:id]の確認、post.checkedの確認する
    item = Post.find(params[:id])
    render json: {post: item}
    #postにitemが入っている
    
  end
end
