class UserMailer < ApplicationMailer
    def dashboard_report(user, people)
        report_service = ReportService.new()
        @user = user
        csv_data = report_service.generate_people_balance_csv(people)

        attachments['people_balances.csv'] = { mime_type: 'text/csv', content: csv_data }
        mail(to: @user.email, subject: 'People Balances with CSV')
    end
end
