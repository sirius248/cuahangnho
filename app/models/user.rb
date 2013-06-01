class User < ActiveRecord::Base
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, :presence => true, :uniqueness => true, format: { with: /^[a-zA-Z0-9_]+$/, message: 'Tên Không Đúng', :multiline => true}
	validates :email, :presence => true, :uniqueness => true, format: { with: VALID_EMAIL_REGEX }
	validates :password, :presence => true, length: {minimum: 6}


	attr_accessible :avatar, :name, :email, :password, :password_confirmation

	has_secure_password

	has_attached_file :avatar, :styles => {
		:medium => "300x300>", 
		:thumb => "100x100>"
	}, :default_url => "/ninja.png", :content_type => ['image/jpeg', 'image/png', 'image/gif']

	before_save { self.email = email.downcase }
	before_save :create_remember_token
	before_validation :generate_slug


	def to_param
		slug
	end

	private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

    def generate_slug
    	self.slug ||= name.parameterize
    end
end
