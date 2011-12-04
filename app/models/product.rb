class Product < ActiveRecord::Base
  default_scope :order => 'title'
  has_many :line_items
  has_many :orders, :through => :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
    private
  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
  if line_items.empty?
    return true
  else
    errors.add(:base, 'Line Items present')
    return false
  end
  end
  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to =>0.01, :message => 'Your number is not big enough!'}
  validates :title, :uniqueness => true, :length => {:minimum => 10}
  
  validates :image_url, :format => {
    :with => %r{\.(gif|jpg|png)$}i,
    :message => 'must be a URL for GIF, JPG or PNG image.'
  }
  
  ALLOWED_CATEGORY = ["Books","Movies","Music"]
  validates_inclusion_of :category, :in => ALLOWED_CATEGORY
  
  
  scope :books, where(:category => 'Books')
  scope :movies, where(:category => 'Movies')
  scope :music, where(:category => 'Music')
  
  def self.cheap_books
  where(:category => 'Books').where('price < 5')  
  end
  
  

  
  
end
