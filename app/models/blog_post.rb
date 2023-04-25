class BlogPost < ApplicationRecord
    has_rich_text :content

    validates :title, presence: true
    validates :content, presence: true 

    scope :sorted, -> { order(arel_table[ :created_at].desc.nulls_last).order(updated_at: :desc) }
end