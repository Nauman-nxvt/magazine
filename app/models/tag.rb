class Tag < ApplicationRecord
  has_many :articles_tags
  has_many :subtags, class_name: 'Tag', foreign_key: 'parent_tag_id', dependent: :destroy

  accepts_nested_attributes_for :subtags, :reject_if => :all_blank, :allow_destroy => true

end
