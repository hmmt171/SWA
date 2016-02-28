class Content < ActiveRecord::Base
  has_many :category_contents
  has_many :contents, through: :category_contents
  has_one :Recommended
  is_impressionable

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    end
  end

  acts_as_taggable_on :tags
  acts_as_taggable

end
