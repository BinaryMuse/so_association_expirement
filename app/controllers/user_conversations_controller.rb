class UserConversationsController < ApplicationController
  include ApplicationHelper

  def index
    @user = User.find params[:user_id]
    @conversations = @user.user_conversations
  end

  def show
    @conversation = UserConversation.find params[:id]
  end

  def new
    redirect_to users_path unless current_user

    @user = User.find params[:user_id]
    @conversation = @user.user_conversations.build
    @conversation.build_conversation.messages.build
  end

  def create
    redirect_to users_path unless current_user

    @conversation = UserConversation.new params[:user_conversation]
    @conversation.user = current_user
    @conversation.conversation.messages.first.user = current_user
    @conversation.save!
    redirect_to user_conversation_path(current_user, @conversation)
  end

  def mark_as_read
    @conversation = UserConversation.find params[:id]
    @conversation.update_attributes :read => true
    redirect_to user_conversation_path(current_user, @conversation)
  end

  def mark_as_unread
    @conversation = UserConversation.find params[:id]
    @conversation.update_attributes :read => false
    redirect_to user_conversation_path(current_user, @conversation)
  end
end
