class PostPolicy
  attr_accessor :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def publish?
    #@user.role == "editor"
    @user.editor?
  end

  # def create?
  #    #what even is this?
  #   @user.role == "author" || @user.role == "editor"
  # end

  # def update?
  #   @user.editor? || @user.author?
  # end

end
