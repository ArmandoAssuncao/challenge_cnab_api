namespace :cnab do

  desc "Read cnab.txt and add in bd"
  task insert_cnab: :environment do
<<<<<<< Updated upstream
    puts "The database will be cleared of all content before populating."
    Rake::Task['db:reset'].invoke
=======
    puts 'The database will be cleared of all content before populating.'
    ActiveRecord::Base.connection.execute("TRUNCATE Financial_transactions")
>>>>>>> Stashed changes

    cnab_path = Rails.root + 'lib/data/CNAB.txt'
    IO.foreach(cnab_path) { |x|
      kind = x[0]
      date = x[1...9]
      value = x[9...19]
      cpf = x[19...30]
      card_number = x[30...42]
      hour = x[42...48]

      begin
<<<<<<< Updated upstream
        date = Date.strptime(date, '%m%d%Y')
      rescue Exception => e
=======
        date = Date.strptime(date, '%d%m%Y')
      rescue StandardError
>>>>>>> Stashed changes
        puts "Date #{date} not has the format 'DDMMyyyy' - Line skipped"
        next
      end

      begin
        hour = Time.strptime(hour, '%H%M%S')
        hour
      rescue Exception => e
        puts "Hour #{hour} not has the format 'HHMMSS' - Line skipped"
        next
      end

      date_time = DateTime.new(date.year, date.month, date.day, hour.hour, hour.min, hour.sec)
      date_time += 3.hours # change to UTC+0

      if [1, 4].include? kind.to_i
        FinancialTransaction.create!(
          type_id: kind,
          datetime: date_time.to_date,
          value: value.to_i / 100,
          cpf: cpf,
          card_number: card_number
        )
      end
    }
  end

end
