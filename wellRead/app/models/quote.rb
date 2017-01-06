class Quote < ApplicationRecord
    belongs_to :my_book

    mount_uploader :image, QuoteUploader
end
