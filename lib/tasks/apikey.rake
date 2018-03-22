namespace :apikey do
  desc 'Creates new api key'
  task :generate, %i[email description] => [:environment] do |_t, args|
    puts 'Generating new api key...'
    begin
      apikey = ApiKey.create! email: args.email, description: args.description
      puts "new api key: #{apikey.access_token}"
    rescue StandardError => e
      puts e.message
    end
  end
end
