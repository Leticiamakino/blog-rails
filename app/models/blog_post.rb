class BlogPost < ApplicationRecord
    has_rich_text :body

    validates :title, presence: true
    validates :body, presence: true 

scope :sorted, -> { order(arel_table[:published_at].desc.nulls_last).order(updated_at: :desc) }
scope :draft, -> { where(published_at: nit) }
scope :published, -> { where("published_at <= ?", Time.current) }
scope :scheduled, -> { where("published_at > ?", Time.current)}     

def draft?
    published_at.nil?
end

def published?
    published_at? && published_at <= Time.current
end

def scheduled?
    published_at? && published_at > Time.current
# Ex:- scope :active, -> {where(:active => true)}

end
end