class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user  # Thêm người dùng vào bài viết
    if @post.save
      redirect_to posts_path, notice: "Tạo bài viết thành công!"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "Cập nhật bài viết thành công!"
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      respond_to do |format|
        format.html { redirect_to posts_path, notice: "Xóa bài viết thành công!" }
        format.js   # Kích hoạt destroy.js.erb
      end
    else
      respond_to do |format|
        format.html { redirect_to posts_path, alert: "Không thể xóa bài viết!" }
        format.js   # Xử lý lỗi nếu cần
      end
    end
  end

  def show; end

  private

  # Thiết lập @post cho các action cần dùng
  def set_post
    @post = Post.find(params[:id])
  end

  # Chỉ cho phép các tham số hợp lệ
  def post_params
    params.require(:post).permit(:title, :content, :image)
  end
end
