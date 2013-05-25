class User < ActiveRecord::Base
	has_secure_password

	before_save { self.email = email.downcase }
	before_save :create_remember_token
	before_validation :generate_slug

	validates :name, :presence => true, :uniqueness => true

	validates :email, :presence => true, :uniqueness => true
	validates :slug, :presence => true, :uniqueness => true

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
