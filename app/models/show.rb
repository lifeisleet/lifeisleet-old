class Show < ActiveRecord::Base
  has_paper_trail

  has_many :user_show_associations, -> { where is_owner: false }, dependent: :destroy
  has_many :users, through: :user_show_associations
  has_one :owner_show_association, -> { where is_owner: true }, class_name: "UserShowAssociation", dependent: :destroy
  has_one :owner, through: :owner_show_association, class_name: "User", source: :user

  accepts_nested_attributes_for :user_show_associations
  accepts_nested_attributes_for :owner_show_association

  validates :title, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :domain, presence: true, uniqueness: true
  validates :subtitle, presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { maximum: 4000 }

  validates :language, presence: true
  validates :category, presence: true
  validates :owner_name, length: { maximum: 255 }
  validates :owner_email, length: { maximum: 255 }

  validates :owner, presence: true

  def to_s
    title
  end
end
