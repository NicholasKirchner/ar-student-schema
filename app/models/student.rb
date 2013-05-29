require_relative '../../db/config'
# implement your Student model here

class Student < ActiveRecord::Base
  validates :email, :format => { :with    => /.+@.+\..{2,}/,
                                 :message => "Invalid email address."}
  validates_uniqueness_of :email
  validate  :person_must_be_school_aged
  validates :phone, :format => { :with    => /\d{3}.*\d{3}.*\d{4}/,
                                 :message => "Invalid phone number."}



  def name
    self.first_name + " " + self.last_name
  end

  def age
    age_in_days = Date.today - self.birthday
    (age_in_days/365.25).to_i
  end

  def person_must_be_school_aged
    if age < 5
      errors.add(:birthday, "person must be at least 5")
    end
  end

end

