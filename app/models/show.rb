class Show < ActiveRecord::Base
  has_paper_trail

  has_many :user_show_associations, inverse_of: :show, dependent: :destroy
  has_many :users, through: :user_show_associations

  accepts_nested_attributes_for :user_show_associations

  validates :title, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :domain, presence: true, uniqueness: true
  validates :subtitle, presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { maximum: 4000 }

  validates :language, presence: true
  validates :category, presence: true

  validates :owner_name, length: { maximum: 255 }
  validates :owner_email, length: { maximum: 255 }
  validates :owner_name, presence: true, unless: :owner
  validates :owner_email, presence: true, unless: :owner

  validates :user_show_associations, presence: true
  validates :users, presence: true

  rails_admin do
    field :title
    field :domain
    field :subtitle
    field :description
    field :language
    field :category
    field :subcategory
    field :owner_name
    field :owner_email
    field :explicit
    field :enabled

    field :owner_id, :enum do
      enum_method { :owner_id_enum }
    end

    field :users
  end

  def to_s
    title
  end

  def owner
    usa = user_show_associations.where(is_owner: true).first
    usa ? usa.user : nil
  end

  def owner_name
    owner ? owner.name : read_attribute(:owner_name)
  end

  def owner_email
    owner ? owner.email : read_attribute(:owner_email)
  end

  def owner_id
    owner ? owner.id : nil
  end

  def owner_id=(user_id)
    user_show_associations.where(is_owner: true).first.update_attribute(:is_owner, false) if owner
    user_show_associations.where(user_id: user_id).first.update_attribute(:is_owner, true) if user_id.to_i > 0
  end

  private
  def owner_id_enum
    users.map { |u| [ u.name, u.id ] }
  end
end
