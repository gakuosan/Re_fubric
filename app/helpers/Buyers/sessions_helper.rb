module Buyers::SessionsHelper
  def log_in(buyer)
    session[:buyer_id] = buyer.id
  end

  def remember(buyer)
    buyer.remember # => DB: remember_digest
    cookies.permanent.signed[:buyer_id] = buyer.id
    cookies.permanent[:remember_token] = buyer.remember_token
  end

  def forget(buyer)
    buyer.forget
    cookies.delete(:buyer_id)
    cookies.delete(:remember_token)
  end

  def current_buyer?(buyer)
    buyer == current_buyer
  end

  def current_buyer
    if (buyer_id = session[:buyer_id])
      @current_buyer ||= Buyer.find_by(id: buyer_id)

    elsif (buyer_id = cookies.signed[:buyer_id])
      buyer = Buyer.find_by(id: buyer_id)
      if buyer && buyer.authenticated?(:remember, cookies[:remember_token])
        log_in buyer
        @current_buyer = buyer
      end
    end
  end

  def logged_in?
    !current_buyer.nil?
  end

  def log_out
    forget(current_buyer)
    session.delete(:buyer_id)
    @current_buyer = nil
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end
end
