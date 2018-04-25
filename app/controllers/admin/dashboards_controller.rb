class Admin::DashboardsController < Admin::ApplicationController
  def index
  	@users = User.all
  	@tags = Tag.all
  	@posts = Post.all
  	@tag = Tag.new
  	@comments = Comment.all
  end
end
