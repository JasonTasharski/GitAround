class User < ActiveRecord::Base
	extend FriendlyId
  friendly_id :username, use: :slugged

  has_secure_password
	has_many :itineraries
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates :password, length: { minimum: 6 }, on: :create

  validates :email,
    presence: true,
    uniqueness: true,
    format: {
    with: /@/,
    message: "not a valid format"
  }

end
