class Category < ActiveRecord::Base
  has_and_belongs_to_many :posts

  before_save :generate_slug

  def self.from_param slug; where(slug: slug).first! end
  def to_param; slug end

  private

    def generate_slug
      self.slug = name.to_slug.normalize.to_s
    end
end
