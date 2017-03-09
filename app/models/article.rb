class Article < ApplicationRecord
  belongs_to :user
  has_many :articles_tags, dependent: :destroy
  has_many :tags, through: :articles_tags, dependent: :destroy
  has_many :subtags, through: :tags
  accepts_nested_attributes_for :tags, :reject_if => :all_blank, :allow_destroy => true
  validates :title, :description, presence: true

  def self.search(search)
    includes(:tags).where('tags.name' => search).all + includes(:subtags).where('tags.name' => search).all + where("title LIKE ?", "%#{search}%") + where("description LIKE ?", "%#{search}%")
  end
end
