class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  def index
  end
  
  def assignments
    
    # reset elective attendance numbers to zero
    Elective.all.each do |elective|
      elective.update_attributes({:attendance => 0})
    end
    User.all.each do |user|
      user.update_attributes({:firstElective => ""})
      user.update_attributes({:secondElective => ""})
    end
    @shuffledUsers = User.all.shuffle
    @shuffledUsers.each do |user|
      unless user.admin?
        electiveChoices = [user.firstChoice, user.secondChoice, user.thirdChoice, user.fourthChoice]
        electiveChoices.each do |elective|
          electiveObject = Elective.find_by!(title: elective)
          if electiveObject.attendance < electiveObject.capacity
            user.update_attributes({:firstElective => elective})
            electiveObject.update_attributes({:attendance => electiveObject.attendance+1})
            break
          end
        end
      end 
    end
    
    # reset elective attendance numbers for second round
    Elective.all.each do |elective|
      elective.update_attributes({:attendance => 0})
    end
    
    @shuffledUsers.reverse.each do |user|
      unless user.admin?
        electiveChoices = [user.firstChoice, user.secondChoice, user.thirdChoice, user.fourthChoice]
        electiveChoices.each do |elective|
          electiveObject = Elective.find_by!(title: elective)
          # user cannot get same elective twice
          if elective != user.firstElective
            if electiveObject.attendance < electiveObject.capacity
              user.update_attributes({:secondElective => elective})
              electiveObject.update_attributes({:attendance => electiveObject.attendance+1})
              break
            end
          end
        end
      end 
    end
  end
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :firstChoice, :secondChoice, :thirdChoice, :fourthChoice, :firstElective, :secondElective, :admin])
  end

end
