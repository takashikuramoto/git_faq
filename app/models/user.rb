class User < ApplicationRecord
  
  has_one_attached :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :questions, ->{ order("created_at DESC") }
  has_many :answers, ->{ order("updated_at DESC") }
  has_many :answered_questions, through: :answers, source: :question
  has_many :feed_contents, ->{ order("updated_at DESC") }

  def name
    "#{family_name} #{first_name}"
  end

  def name_kana
    "#{family_name_kana} #{first_name_kana}"
  end
  
  def full_profile?
    image.attached?  && family_name? && first_name? && family_name_kana? && first_name_kana?
  end
end
