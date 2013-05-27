Paperclip::Attachment.default_options.update({
  :storage => :fog,
  :fog_credentials => {
    :provider           => 'Google',
    :google_storage_access_key_id => 'GOOGLZZ34FUDEYNXWJDZ',
    :google_storage_secret_access_key  => 'NXhVkobkv2aj7tZvSl17xxNyHDyt+RrY/yh2ibxk',
  },
  :fog_directory => 'littleshop',
  :fog_public => true,
  :fog_host => 'http://littleshop.commondatastorage.googleapis.com'
})