class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name

  def first_name
    self.name.split.first#self.name - ime user-a, split uzima string i deli ime u 2 dela first ime, last prezime Hi, John!
  end

  def last_name
     self.name.split.last
  end
end