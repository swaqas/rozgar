class AdminUser < ActiveRecord::Base

  validates :login, :presence   => true,
    :uniqueness => true,
    :length     => { :within => 6..100 }

  validates :password, :presence   => true,
    :length     => { :within => 6..100 }

  validates_confirmation_of :password
  validates_presence_of :password_confirmation, :message=>"password dose not match.."

  before_save :encrypt_password, :if => :has_passowrd?

 def encrypt_password
    return if password.blank?
    self.password = Digest::MD5.hexdigest(password)
  end

  def has_passowrd?
    !password.blank?
  end

  def self.authenticate(login, password)
    return AdminUser.find(:first, :conditions => ["login = ? AND password = ? ", login, AdminUser.encrypt_password(password)])
  end

 def self.encrypt_password(pwd)
    Digest::MD5.hexdigest(pwd)
 end

# def self.all
#    return AdminUser.find(:all, :conditions => ["super = false"])
# end


end
