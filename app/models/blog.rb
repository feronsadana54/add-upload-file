class Blog < ApplicationRecord
    has_one_attached :image

    validates :title, presence: true
    validates :body, presence: true 
    validate :validate_image



    private def validate_image 
        if image.attached? && !image.content_type.in?(%('image/jpeg image/png'))
            errors.add(:image, 'must be a JPEG or PNG')
        elsif image.attached? == false 
                errors.add(:image, 'must be attached')
        end
    end

    private def validate_file 
        if file.attached? && !file.content_type.in?(%('application/pdf application/doc '))
            errors.add(:file, 'must be a PDF or DOC')
        elsif file.attached? == false 
            errors.add(:file, 'must be attached')
        end
    end
end
