class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper                                                        #SessionsHelper(メソッドの集合体)を全コントローラに適用

  def toppage
    render html: "RefabricTopページ"
  end
end
