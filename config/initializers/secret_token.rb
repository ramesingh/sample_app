# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
#
#SampleApp::Application.config.secret_token = 'ebb44a5fcfb4931437c0cac2206e0a15cec74ea7744e81cc73e6011b0fd5bfde294367fb69800dc44b261296593230432bd6a445328fbf4f7b2713d35196b9eb'
#

#make sire yur secret_key_base is kept private
## if you're sharing your code publicly
#
require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		# Use the existing token.
		File.read(token_file).chomp
	else
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end

SampleApp::Application.config.secret_key_base = secure_token
