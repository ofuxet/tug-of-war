class User < ActiveRecord::Base
	validates_acceptance_of :terms_of_service, :on => :create
	validates_confirmation_of :password
	validates_presence_of :email, :password, :password_confirmation
	validates_presence_of :name, :on => :create
	validates_length_of :name, :minimum => 4, :on => :create
	validates_length_of :password, :minimum => 6
	validates_uniqueness_of :name, :case_sensitive => false, :on => :create
	validates_uniqueness_of :email, :case_sensitive => false
end
