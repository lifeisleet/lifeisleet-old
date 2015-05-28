class UserShowAssociation < ActiveRecord::Base
  belongs_to :user, inverse_of: :user_show_associations
  belongs_to :show, inverse_of: :user_show_associations

  validates :user, presence: true, uniqueness: { scope: :show }
  validates :show, presence: true
  validates :is_owner, uniqueness: { scope: :show, if: :is_owner? }
end
