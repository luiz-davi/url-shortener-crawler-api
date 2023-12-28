namespace :persist_websites do
  desc "Create available websites in database"
  task perform: :environment do
    websites = JSON.parse(
      File.read(
        Rails.root + 'lib/static/websites.json'
      )
    )

    websites.each do |website|
      site = Website.find_or_initialize_by(website)

      site.save
    end

  end

end
