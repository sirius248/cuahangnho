class User < ActiveRecord::Base
	validates :name, :presence => true, :uniqueness => true
	validates :email, :presence => true, :uniqueness => true

	attr_accessible :avatar, :name, :email, :password, :password_confirmation

	has_secure_password

	has_attached_file :avatar, :styles => {
		:medium => "300x300>", 
		:thumb => "100x100>"
	}, :default_url => "/ninja.png", :content_type => { :content_type => "image/*" }

	before_save { self.email = email.downcase }
	before_save :create_remember_token
	before_validation :generate_slug

	
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
