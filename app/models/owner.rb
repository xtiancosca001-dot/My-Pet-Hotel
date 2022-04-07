class Owner < ApplicationRecord
    has_many :pets

    VALID_STATUSES = ['public', 'private', 'archived']

    validates :status, inclusion: { in: VALID_STATUSES }

    def archived?
        status == 'archived'
    end
end
