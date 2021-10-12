class TeamMailer < ApplicationMailer

  # 以下のメソッドを”同じ”Viewを作成する必要がある。
  def team_change_mail(team)
    @team = team
    # send = @team.owner.email
    # binding.pry
    # to：送信先　from：送信元
    # mail to: "aaa@com.jp", subject: "権限移動の確認メール"
    mail to: "#{@team.owner.email}", subject: "権限移動の確認メール"
    # <h4>name: <%= @team.name %></h4>
  end

end
