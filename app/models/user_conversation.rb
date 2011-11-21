class UserConversation < ActiveRecord::Base
  belongs_to :user
  belongs_to :conversation
  has_many :messages, :through => :conversation

  accepts_nested_attributes_for :conversation

  delegate :subject, :to => :conversation

  attr_accessor :to
  before_create :create_user_conversations

  def all_users
    UserConversation.where(:conversation_id => conversation).map(&:user).sort { |u1, u2| u1.name <=> u2.name }
  end

private

  def create_user_conversations
    return if to.blank?

    to.each do |recip|
      UserConversation.create :user_id => recip, :conversation => conversation
    end
  end
end
