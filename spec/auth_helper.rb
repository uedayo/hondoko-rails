module AuthHelper
  require 'ostruct'

  VALID_USER = OpenStruct.new({:screen_name => "uedayo",
                               :last_name_kanji => "姓",
                                :first_name_kanji => "名",
                                :last_name_hiragana => "せい",
                                :first_name_hiragana => "めい",
                                :email => "example@example.com",
                                :image_url => "https://pbs.twimg.com/profile_images/2284174758/v65oai7fxn47qv9nectx_bigger.png",
                                :division => "1",
                                :remember_token => "asdfghjkl1234567890"})

  def user_login(biglobe_id=VALID_ACTOR.biglobe_id, password=VALID_ACTOR.password, sid=VALID_ACTOR.sid)
    session[:actor] = ActorEntity.new :biglobe_id => biglobe_id, :password => password,
                                      :sid => sid, :name => VALID_ACTOR.name, :corporate_name => "ＮＥＣビッグローブ株式会社",
                                      :user_count => 123
  end

  def actor_logout
    session[:actor] = nil if session[:actor]
    session[:prev_url] = nil if session[:prev_url]
  end

end

include AuthHelper