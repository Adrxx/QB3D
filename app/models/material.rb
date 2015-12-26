class Material < ActiveRecord::Base
  has_many :colors
  accepts_nested_attributes_for :colors, reject_if: :all_blank, allow_destroy: true
end
