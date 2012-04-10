module SessionsHelper
def sign_out
    cookies.delete(:remember_token)
    self.current_user = nil
  end

end
