Gakuポートフォリオ設計

１.テーマ：生地工場で残ったアパレル向け生地の再利用

サービス名　*Re：fublic*

概要：

* 目的： 国内生地の再利用を目的とする。
* 観点 ：生地生産工場でアパレル企業の要望するSKUに対して生産ロットに合わず生地が余っている。（勿体無い）
* 現状 ：良質な生地が大量に捨てられたり投げ売りされている。
* ニーズ： OEMメーカーや商社はいいものを安く作りたいが、生地ロットの問題で少量でものを作れないまた、国内の中小のアパレルメーカーにもニーズがあるのではないかと仮定(自分の経験から、国内にはいい生地屋さんが多いしすぐ使いたいが情報が身内の情報すぎておりてこない。アパレルメーカー 商社 アパレルOEM会社（総称して商社）
* 生産地： 日本国内
* ニーズがあれば空気に入り機能でfavが10を超えたら生地屋側は商社の意向を受けて小さなロット生産も検討
    

主な機能：

　＜生地屋側＞

* 生地屋さんが売りたい生地の画像を投稿出来る。画像アップロード（生地画像）をできる。また見やすいように生地を拡大できる。
* 生地在庫数量の入力と在庫管理ができる。
* 生地情報（色目付糸番手糸番手染め方などの生地情報）を入力できる。
* 生地毎の生地値の入力/Meter単位の金額を入力出来る
* 在庫管理が出来る
* いいねが10件以上について要望に応じて１から生地を再生産を検討する。
* 非同期通信（JS AJAXのjQueryのの画面タッチ時に色がわかる.DOMでいいね表示できるアヤックスでDBの*書き換え*）*一部の情報をサーバーに送信して、それを受けつけ反映させる仕立てイメージコードは下記となります下記Quita生地を参照*
* https://qiita.com/hisamura333/items/e3ea6ae549eb09b7efb9

　＜商社：買手側＞

* 生地へのいいね機能（Ajax）がある
* 欲しい生地の検索。色、糸番手、編み方、織り方など欲しい生地を条件毎に探せる。ranstack?
* 生地値の確認が出来る
* 在庫生地の確認が出来る
* サンプル生地発送依頼ができる。


　＊在庫管理機能：実装します。
　●在庫管理できる
　●出荷予定日が通知される。
　●その時いくら在庫が残っているかわかる
　

　＜決済機能：実装する＞
　カード情報を入力し決済できる。
　ユーザー登録からAPIキーを取得.

*データカラム*

①生地(fabrics) 

色　fabric_color：string 　
重さ　fabric_weight :integer　 
糸番手　fabric_yarn_count :integer　
編み方織り方　fabric_knitting_way:string     
価格　fabric_price:integer
生地混合率　fabric composition:integer
生地のID：fabric_id integer 
生地数量：fabric_counts integer


②Buyer
email:string 
password:string 
confirmation_password :string 
user_name:string 
company_name:text
company_address:text
id :integer

③Seller
email:string 
password:string 
confirmation_password :string 
user_name:string 
company_name:text
company_address:text
id :integer
adress:string
stocks:text
fabric-price
fabric_stocks

④いいね機能　likes     
fabric_id:integer     
fabric_maker_id:integer


⑤在庫数量　Stocks
生地のID：fabric_id :integer
残メーター数:fabric_meter_count :integer
発送元　　　religion:text
発送までの日数　shipping_date:integer
生地の価格　　fabric_price:integer
生地屋のID　　buyer_id
商社のID　　　seller_id


⑥生地発注履歴；oRDER_FABRICS

* プライマリーキー：id
* ユニークキー：buyer_id,fabric_id,order_idの組み合わせが一意
* 外部キー：buyer_idはbuyersテーブルの外部キーとなり、fabric_idfabricsテーブルの外部キーとなり、order_idはordersテーブルの外部キーとなる
* その他制約

 - BuyerID（フィールド名　buyer_id, 型：intger）：null値許可しない 
 - FabricID（フィールド名：  fabric_id, 型：intger）：null値許可しない 
 -OrderID（フィールド名：order_id, 型：intger）：null値許可しない 
 - Price（フィールド名：price, 型：intger）：null値許可しない 
 - 購入M数（フィールド名：quantity, 型：intger）：null値許可しない 



⑦ordersテーブル

* プライマリーキー：id
* その他制約

 - 送付先住所（フィールド名：address, 型：string）：null値許可しない 




２.設計

2-1.画面設計 

caccooを使用

draw.ioを使用します。（フロー図）

＊備考：7/4修正しました。＠matsushinさんチェックお願いします

[Image: Refublic  ERdrawio (1) (2)-20190623修正-20190704.png]

画面遷移図（2019.06.30修正しました）



* 画面遷移図   画面遷移図 (5).　Refublic-20190628 (1)-20190628 (1)-20190628.pdf (https://quip.com/-/blob/cPaAAA176w6/EkT7rF_7TEAu5GEmjfxBWQ?s=7nzBAn5XM8re&name=%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3%20(5).%E3%80%80Refublic-20190628%20(1)-20190628%20(1)-20190628.pdf)




*2-2.URL設計 *


routes.rbに記載。session   indexで定義


Rails.application.routes.draw do
  root to: 'fablics#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'

  resources :sellers, only: [ :new, :create, :destroy ]
  resources :buyers, only: [:index, :show, :new, :create]
  resources :stocks, only: [:index, :show, :new, :cretae]
  resources :fabrics, only: [:show, :new, :create, :edit, :update] do
      Buyers do
      get :likes
      get :orders
    end
  end
  
  resources :likes, only:[:create, :destroy]
  resources :order, only:[ :new, :create, :destroy ]
  resources :order_fabrics[:create, :destroy]
  
end


設計

* 画面遷移図   画面遷移図 (5).　Refublic-20190628 (1)-20190628 (1)-20190628.pdf (https://quip.com/-/blob/cPaAAA176w6/EkT7rF_7TEAu5GEmjfxBWQ?s=7nzBAn5XM8re&name=%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3%20(5).%E3%80%80Refublic-20190628%20(1)-20190628%20(1)-20190628.pdf)
* ワイヤーフレーム　ワイヤーフレーム20190707.pdf (https://quip.com/-/blob/cPaAAA176w6/-SkvTA3sVok3FQHnFoopoA?s=7nzBAn5XM8re&name=%E3%83%AF%E3%82%A4%E3%83%A4%E3%83%BC%E3%83%95%E3%83%AC%E3%83%BC%E3%83%A020190707.pdf) 
* DB設計
* URL設計





３.タスクばらし（生地屋<Seller>と商社側<Buyer>で分けます）

実装

＜SellerとBuyer共通＞

* ①ログイン画面
    * メールアドレスを入力できる
    * パスワードを入力できる
    * ログイン後、生地一覧画面に遷移できる
        * Flashメッセージ表示
    * ユーザ登録画面に遷移できる
    * 見た目調整
* ②ユーザ登録画面
    * ユーザ名を登録できる （rails g device user rails g device view)
    * メールアドレスを登録できる
    * パスワードを登録できる
        * パスワード確認をできる　repassword: params[:repassword] )
        * 登録したら生地一覧画面に遷移できる
    * 
        * Flashメッセージ表示；　例として<% flash.each do |message_type, message| %> <div class="alert alert-<%= message_type %>">
        * <%= message %> </div>
        * <% end %>
    * 見た目調整（Bootstrap)

　＜Sellerのみの機能＞

* ③生地情報登録画面
    * 生地情報を登録出来る
    * 生地毎の生地値を登録出来る
    * 生地のカテゴリを登録できる
    * 見た目調整

* ④生地在庫入力画面
    * 生地毎の在庫数量を入力出来る
    * 在庫の変動を確認出来る
    * 在庫管理が出来る

* ⑤受注・出荷画面
    * オーダーに対して出荷出来る
    * 出荷後の在庫数量を更新出来る
    * 顧客への発送指示が出来る
    * 出荷されたら確認メールがBuyerに送信される。

*　＜Buyer（商社）のみの機能＞*

* *⑥商社側生地情報確認画面*
    * 生地の一覧を見れる
    * 欲しい生地の検索ができる(ranstack)  →rails g model relatinship? ＊ application controller内に定義（before＿action＿set＿search）
    * 生地への評価⭐️（Like)をつける。→accepted_nested_attribute_for。（１つの生地に対して複数のBuyerが評価）


         ⑦ 気になった生地に対していいねが出来る


    * 生地にいいねができる→rails g comment likes　varidate uniquness ofとしてLikesをする人がUniqueなコメントをかけるようにする
    * 生地のいいねをキャンセルできる
    * 見た目調整
* ⑧在庫確認画面
    * 在庫数量を確認できる
* ⑨生地購入画面：生地の購入が出来る。→GemのPay.jpで決済機能を搭載する。https://qiita.com/trn031/items/d7684ed91178adac7932

　　＜その他項目＞

* その他チェック事項
* 単体テスト（Rspec)　　rails g Rspec
    * モデルのテスト
    * コントローラのテスト
* 結合テスト（Rspec　FactoryBot)
* レスポンシブ対応
* バグ対応
    * ログインしていない状態で投稿詳細画面に遷移すると、エラーになる（非ログインアクセス設定）

lass ApplicationController < ActionController::Base

  before_action :buyer_logged_in?
  before_action :seller_logged_in?

  def user_logged_in?
    if session[:user_id]
      begin
        @current_user = User.find_by(user_id: session[:user_id])
      rescue ActiveRecord::RecordNotFound
        reset_user_session
      end
    end
    return if @current_user
    # @current_userが取得できなかった場合はログイン画面にリダイレクト
    flash[:referer] = request.fullpath
    redirect_to login_index_path
  end
  
  def reset_user_session
    session[:user_id] = nil
    @current_user = nil
  end
end

* seedファイル準備(初期データを作成し、application controlerにbefore authorization expext index/showと設定
* AWSへのデプロイ＊可能であればDockerも使いたい　Diango２　Pytthon3（rails env phython3)　Postgresql　or  MySQL    Nginx

個人メモ


* テンプレートエンジンはSlim（erbはやめる）
* ユーザ認証機能はdeviseを使う
* 画像アップロードはActive Storageを使う＋minimagic
* Pantoneカラーで選ぶ　gem colorcodeで定義
* WebDriverを使おう(ChromeDriver❌）
* 在庫データはCSVで入力し随時更新できる。
* AWSで本番環境にUP
* kaminari   yarnを使用する。
* 間に合ったらUdemyでVueJSを勉強して見ようかなとも思ってます

