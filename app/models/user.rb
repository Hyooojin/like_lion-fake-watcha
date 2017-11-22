class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
# 권한부여
def admin?
  if role == "admin" #user class 여서 role로 바로 접근 가능
    true

  else
    false
  end
end


end
