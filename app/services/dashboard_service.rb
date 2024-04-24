# app/services/dashboard_service.rb
class DashboardService
    def initialize(user)
      @user = user
    end
  
    def dashboard_data
      Rails.logger.debug "Fetching dashboard data"
      {
        active_people_pie_chart: active_people_pie_chart,
        balance: balance,
        last_debts: last_debts,
        last_payments: last_payments,
        total_payments: total_payments,
        total_debts: total_debts,
        my_people: my_people,
        top_person: top_person,
        bottom_person: bottom_person
      }
    end
  
    private
  
    attr_reader :user
  
    def active_people_pie_chart
       {
      active: Person.where(active: true).count,
      inactive: Person.where(active: false).count
      }
    end

    # Total somando todos associados ativos
    def active_people_ids
      @active_people_ids ||= Person.where(active: true).select(:id).map(&:id)
    end

    def total_debts
      Debt.where(person_id: active_people_ids).sum(:amount)
    end

    def total_payments
      Payment.where(person_id: active_people_ids).sum(:amount)
    end

    def balance
       total_payments - total_debts
    end

    # últimos lançamentos
    # no formato somente id + amount para o kickchart
    def last_debts
      Debt.order(created_at: :desc).limit(10).map do |debt| [debt.id, debt.amount] end
    end

    def last_payments
      last_t = Payment.order(created_at: :desc).limit(10).map do |payment| [payment.id, payment.amount]

      end
    end

    # últimos associados cadastrados pelo usuário atual
    def my_people
       Person.where(user: user).order(:created_at).limit(10)
    end

    people = Person.all.select do |person|
      person.balance > 0
    end.sort_by do |person|
      person.balance
    end

    # associado com maior saldo
    def top_person
      people = Person.all.select { |person| person.balance > 0 }.sort_by(&:balance)
    people.last
    end
    # associado com menor saldo
    def bottom_person 
      people = Person.all.select { |person| person.balance > 0 }.sort_by(&:balance)
      people.first
    end
  end
  