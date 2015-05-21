class Show < ActiveRecord::Base
  has_paper_trail

  validates :title, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :domain, presence: true, uniqueness: true
  validates :subtitle, presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { maximum: 4000 }

  validates :language, presence: true
  validates :category, presence: true
  validates :owner_name, length: { maximum: 255 }
  validates :owner_email, length: { maximum: 255 }

  def to_s
    title
  end
end
