class ReportsController < ApplicationController
  def balance
    people = Person.select(:name, :balance).order(:name)
    
    # Convertendo a coleção em uma lista de hashes serializável
    people_data = people.map { |person| { name: person.name, balance: person.balance } }
    
    UserMailer.dashboard_report(current_user, people_data).deliver_later
    redirect_to root_path, notice: 'Relatório enviado para seu e-mail'
  end
end
