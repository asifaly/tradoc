class LetterOfCredit < ApplicationRecord
  has_many_attached :files
  belongs_to :user
  belongs_to :team

  validates_presence_of :client, :expiry_date, :lc_number, :files

  # validate :file_validation
  #
  # def file_validation
  #   if files.attached?
  #     files.each do |file|
  #       if file.blob.byte_size > 1000000
  #         file.purge
  #         errors[:base] << 'File size too big'
  #       elsif !%w[application/pdf image/jpeg image/png].include? file.blob.content_type
  #         file.purge
  #         errors[:base] << "Wrong format #{file.blob.content_type} not allowed. Upload jpg/jpeg/png/pdf files only"
  #       end
  #     end
  #   end
  # end
end