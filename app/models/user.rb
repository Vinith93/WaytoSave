require 'digest'
class User < ActiveRecord::Base
  attr_accessor :password
    
  before_save :encrypt_new_password, :set_login_field
  validates_presence_of :email, :password, :first_name, :last_name, :bio, :birth_day
  validates_uniqueness_of :email, :first_name
  validates_confirmation_of :password , :if => :password_required?


   def self.authenticate(email,password)
    user = find_by('login = :value OR email = :value',{:value => email})
    return user if user && user.authenticated(password)
   end
   
   def authenticated(password)
    self.hashed_password == encrypt(password)
   end

  protected

    def set_login_field
      self.login = "#{self.first_name} #{self.last_name}".strip
    end

    def encrypt_new_password
      return if password.blank?
      self.hashed_password = encrypt(password)
    end

    def password_required?
      hashed_password.blank? || password.present?
    end

    def encrypt(string)
      Digest::SHA1.hexdigest(string)
    end
end
