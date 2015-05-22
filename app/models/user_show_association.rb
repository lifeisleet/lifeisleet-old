class UserShowAssociation < ActiveRecord::Base
  belongs_to :user
  belongs_to :show

  validates :user, uniqueness: { scope: :show }
  validates :is_owner, uniqueness: { scope: :show, if: :is_owner? }
end
