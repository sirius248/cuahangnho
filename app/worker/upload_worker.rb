
class	UploadWorker
	include Sidekiq::Worker

	def perform(user_id, params)
		user = User.find(user_id)
		user.update_attributes(params)
	end
end