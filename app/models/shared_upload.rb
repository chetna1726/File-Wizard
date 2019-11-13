class SharedUpload < ApplicationRecord
  belongs_to :user
  belongs_to :upload
end