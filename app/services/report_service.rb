class ReportService
    require 'csv'
  
    def generate_people_balance_csv(people_data)
      CSV.generate(headers: true) do |csv|
        csv << ['Name', 'Balance']
        people_data.each do |person|
          csv << [person[:name], person[:balance]]
        end
      end
    end
  end
  