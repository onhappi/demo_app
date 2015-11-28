class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :email, :name ,:password, :password_confirmation 

 email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 validates :name, :presence => true,
        :length =>{:maximum =>50}
 validates :email, :presence => true,
        :format =>{:with => email_regex }, :uniqueness =>      {:case_sensitive => false}

validates :password, :presence => true,
          :confirmation => true, # create "passsword_confirmation"
          :length =>{:within => 6..40}

before_save :encrypt_password

def has_password?(submitted_password)
  encrypte_password == encrypt(submitted password)
end

def self.authenticate(email,submitted_password)
  user = find_by-email(email)
  return nil if user.nil?
  return user if user.has-password?(submitted_password)
  return nil
end
 
private
 
  def encrypt_password
   self.encrypted_password = encrypt(password)
  end

  def enycrypt(string)
   string 
  end

  def encrypt(string)
     Digest::SHA2.hexdigest(string)
  end
end
