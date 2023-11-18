class ApplicationController < ActionController::Base
	before_action :basic_auth
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,  :last_name, :first_name,:furigana_last_name,:furigana_first_name, :birthday ])

  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_of_USER'] && password == ENV['BASIC_of_PASSWORD']
    end
  end
end

# 環境変数はどのパソコンでも一つのものに統一されている。
# アプリによって追加したい場合は、ENV['BASIC_of_USER']ENV['BASIC_of_PASSWORD']にて追加。
# 変数として認識させる。(vc上で特定させない為に)
# BASIC_of_USER=(vim ~/.profile)で入力したuser
# BASIC_of_PASSWORD=(vim ~/.profile)で入力したpassword

# vim ~/.profile
# →export BASIC_AUTH_USER="admin"
# export BASIC_AUTH_PASSWORD="2222"
# export BASIC_of_USER="yuuri"
# export BASIC_of_PASSWORD="39592"
# ターミナル上では大文字で記載。Esc→:wq→enter
# 追加変更した後は、source ~/.profileをターミナルで入力、enterで保存完了。
# その後、renderのEnvironmentにて、addで追加後、追加したkeyとvalueを入力後、save。
# →logを見て、liveが出た後、urlを確認。
# 一度、ログイン（userとパスワード)した場合はシークレットモード→上のurlにlocallhostで再入場。

