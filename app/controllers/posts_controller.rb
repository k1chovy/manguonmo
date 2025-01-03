class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: "Tạo bài viết thành công!"
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: "Cập nhật bài viết thành công!"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  
    respond_to do |format|
      format.html { redirect_to posts_path, notice: "Xóa bài viết thành công" }
      format.js   # Xử lý phản hồi AJAX qua destroy.js.erb
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  

  private

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end
  allow_unauthenticated_access only: %i[ index show ]
  # ...
end
