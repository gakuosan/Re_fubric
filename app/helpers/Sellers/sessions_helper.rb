module Sellers::SessionsHelper
  def log_in(seller)
    session[:seller_id] = seller.id
  end

  def remember(seller)
    seller.remember
    # => DB: remember_digest
    cookies.permanent.signed[:seller_id] = seller.id
    cookies.permanent[:remember_token] = seller.remember_token
  end

  def forget(seller)
    seller.forget
    cookies.delete(:seller_id)
    cookies.delete(:remember_token)
  end

  def current_seller?(seller)
    seller == current_seller
  end

  def current_seller
    if (seller_id = session[:seller_id])
      @current_seller ||= Seller.find_by(id: seller_id)

    elsif (seller_id = cookies.signed[:seller_id])
      seller = Seller.find_by(id: seller_id)
      if seller && seller.authenticated?(:remember, cookies[:remember_token])
        log_in seller
        @current_seller = seller
      end
    end
  end

  def logged_in?
    !current_seller.nil?
  end

  def log_out
    forget(current_seller)
    session.delete(:seller_id)
    @current_seller = nil
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end
end
