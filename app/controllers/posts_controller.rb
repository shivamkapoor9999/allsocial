class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_post, only: [:destroy]
  before_action :authorize_user, only: [:destroy]

  def index
    @post = Post.new
    
    @posts = Post.all.reverse()
    @postsPaging=Post.all

    @page = params[:page].blank? ? 1 : params[:page].to_i
     @count = params[:count].blank? ? 2 : params[:count].to_i
     l = @count
     @max_pages = @posts.length/l
 
  
     @postsPaging = @postsPaging.offset(@count * (@page-1)).limit(@count)
 
     @comment = Comment.new
     @upload_image = UploadImage.new


  end

  def create

    @post = Post.new(post_params)
    if(!@post.content.empty? || !params[:images].blank?)
     
    @post.user = current_user
    @post.save

    
    
    if (!params[:images].blank?)
        
        params[:images].each { |image|
         u = @post.upload_images.new(uploaded_image: image)
         u.user = current_user
         u.save
        }
      end
    end
    # @comment = Comment.new
  end

  def destroy
    @post_id = @post.id
    @post.destroy
    
  end
  def users
    @users=User.all
  end

  def addfriend
     if(params[:message].to_i==1)
      fr =  User.find_by(email:params[:friend]+".com")
      @friend =Friendship.find_by(user:fr,friend:current_user)
      @friend.confirmed = true
      @friend.save
  
    else 
    @friend =Friendship.new
    @friend.user = current_user
    @friend.friend = User.find_by(email:params[:friend]+".com")

    @friend.save
    end
   
  end

  def delfriend
    @friend=Friendship.find_by(id:params[:id].to_i)
    @friend_id = @friend.id
    @friend.destroy
  end

  private

  def post_params
    params.require(:post).permit(:content, image: [:uploaded_image_file_name, :uploaded_image_file_size, :uploaded_image_content_type, :uploaded_image_updated_at])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def authorize_user
    if @post.user != current_user
      return redirect_to root_path
    end
    return true

  end

end
