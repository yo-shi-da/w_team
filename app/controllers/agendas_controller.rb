class AgendasController < ApplicationController
  # before_action :set_agenda, only: %i[show edit update destroy]

  def index
    @agendas = Agenda.all
  end

  def new
    @team = Team.friendly.find(params[:team_id])
    @agenda = Agenda.new
  end

  def create
    @agenda = current_user.agendas.build(title: params[:title])
    @agenda.team = Team.friendly.find(params[:team_id])
    current_user.keep_team_id = @agenda.team.id
    if current_user.save && @agenda.save
      redirect_to dashboard_url, notice: I18n.t('views.messages.create_agenda') 
    else
      render :new
    end
  end
  
  # binding.pry

  def destroy
    @agenda = Agenda.find(params[:id])
    if @agenda.destroy
      team_no = @agenda.team_id
      team_users = User.where(keep_team_id: team_no)
      team_users_email = team_users.pluck(:email)
      
      team_users_email.each do |team_user_email| 
        AgendaMailer.team_all_mail(team_user_email).deliver
      end

      redirect_to dashboard_path, notice: "Agendaを削除しました。なお、チーム全員にメールを送信しております。"
    else
      redirect_to dashboard_path, notice: "Agendaは、削除できませんでした。"
    end
    # <% binding.pry %>

  end

  private

  def set_agenda
    @agenda = Agenda.find(params[:id])
  end

  def agenda_params
    params.fetch(:agenda, {}).permit %i[title description]
  end
end