class Upload < ApplicationRecord
  belongs_to :user
  has_many :shared_uploads

  enum privacy: [:hidden, :shared, :visible]

  mount_uploader :file, FileUploader

  validates :title, :file, presence: true
end
