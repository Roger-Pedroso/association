class UserMailer < ApplicationMailer
    def dashboard_report(user, people_data)
      report_service = ReportService.new()
      @user = user
  
      # Gerando o CSV a partir dos dados serializáveis
      csv_data = report_service.generate_people_balance_csv(people_data)
  
      attachments['people_balances.csv'] = { mime_type: 'text/csv', content: csv_data }
      mail(to: @user.email, subject: 'People Balances with CSV')
    end
  end
  