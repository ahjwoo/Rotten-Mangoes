class Movie < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
# this adds a method avatar_url, provides ways to access it. YOU SMART.

  has_many :reviews

  validates :title, presence: true
  validates :director, presence: true
  validates :runtime_in_minutes, numericality: {only_integer: true}
  validates :description, presence: true
  # validates :poster_image_url, presence: true
  validates :release_date, presence: true
  validate :release_date_is_in_the_past

  def review_average
      reviews.sum(:rating_out_of_ten)/reviews.size
  end

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("title like ? OR director like ? OR runtime_in_minutes < ? OR runtime_in_minutes > ?", "%#{query}%", "%#{query}%", 90, 120)

  end
  
protected

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end
  end
    
end
# where("title like ? OR director like ? OR runtime_in_minutes < ? OR runtime_in_minutes > ?", "%#{query}%", "%#{query}%", 90, 120)