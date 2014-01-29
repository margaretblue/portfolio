class PostPolicy < ApplicationPolicy
  attr_accessor :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def publish?
    #@user.role == "editor"
    @user && @user.editor?
  end

  def create?
     #what even is this?
    if @user
      @user.role == "author" || @user.role == "editor"
    end
  end

  def update?
    if @user
      @user.editor? || @user.author?
    end
  end

  def destroy?
    if @user
      @user.editor? || @user.author?
    end
  end

end
