require 'csv'

CSV.generate do |csv|
  column_names = %w(receipt_number title team_name url)
  csv << column_names
  @apps.each do |app|
    column_values = [
        app.receipt_number,
        app.title,
        app.team_name,
        "https://voteapp2018.planningdev.com#{edit_app_path(app)}"
    ]
    csv << column_values
  end
end
