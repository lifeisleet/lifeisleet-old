class User < ActiveRecord::Base
  has_paper_trail

  devise :database_authenticatable, :rememberable, :trackable, :validatable,
    :lockable

  has_many :user_show_associations, dependent: :destroy
  has_many :shows, through: :user_show_associations

  validates :name, presence: true, uniqueness: true

  rails_admin do
    configure :set_password

    list do
      field :name
      field :email
      field :last_sign_in_at
      field :locked_at
    end

    show do
      field :name
      field :email
      field :last_sign_in_at
      field :last_sign_in_ip
      field :locked_at
    end

    edit do
      field :name
      field :email
      field :set_password
    end
  end

  def to_s
    name
  end

  def set_password; nil; end

  def set_password=(value)
    return nil if value.blank?
    self.password = value
    self.password_confirmation = value
  end
end
