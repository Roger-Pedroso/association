class ReportsController < ApplicationController
    def balance
      # Descomente a linha abaixo depois de implementar o Mailer
      people = Person.all
      UserMailer.dashboard_report(current_user, people).deliver_now
      redirect_to root_path, notice: 'Relatório enviado para seu e-mail'
    end
  end