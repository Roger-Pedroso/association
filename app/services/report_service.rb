require 'csv'
class ReportService
    def generate_people_balance_csv(people)
        CSV.generate(headers: true) do |csv|
            csv << ['Name', 'Balance']
            people.each do |person|
            csv << [person.name, person.balance]
            end
        end
    end
end