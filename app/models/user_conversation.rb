class UserConversation < ActiveRecord::Base
  belongs_to :user
  belongs_to :conversation
  has_many :messages, :through => :conversation

  accepts_nested_attributes_for :conversation

  delegate :subject, :to => :conversation

  attr_accessor :to
  before_create :create_user_conversations

private

  def create_user_conversations
    return if to.blank?

    to.each do |recip|
      UserConversation.create :user_id => recip, :conversation => conversation
    end
  end
end
