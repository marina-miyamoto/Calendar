class Event < ApplicationRecord
    validates :name, presence: true
    validate :validate_name_not_including_comma

    belongs_to :user

    private

    def validate_name_not_including_comma
        errors.add(:name, 'Cannot include comma.') if name&.include?(',')
    end
end
