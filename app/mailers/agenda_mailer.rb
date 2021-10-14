class AgendaMailer < ApplicationMailer

  # 以下のメソッドを”同じ”Viewを作成する必要がある。
  def team_all_mail(agenda)
    # @agenda = agenda
    # binding.pry
    mail to: agenda.to_s, subject: "Agenda削除の確認メール"

    # team_no = @agenda.team_id
    # team_users = User.where(keep_team_id: team_no)
    # team_users_email = team_users.pluck(:email)

    # team_users_email.each do |team_user_email|
    # end
  end

end
# to：送信先　from：送信元
