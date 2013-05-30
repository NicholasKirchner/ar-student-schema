require_relative '../../db/config'
# implement your Student model here

class Teacher < ActiveRecord::Base
  has_many :students

  validates :email, :format => { :with    => /.+@.+\..{2,}/,
                                 :message => "Invalid email address."}
  validates_uniqueness_of :email
  validates :phone, :format => { :with    => /\d{3}.*\d{3}.*\d{4}/,
                                 :message => "Invalid phone number."}

  def name
    self.first_name + " " + self.last_name
  end
end

