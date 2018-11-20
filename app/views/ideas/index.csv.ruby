require 'csv'

CSV.generate do |csv|
  column_names = %w(receipt_number title team_name url)
  csv << column_names
  @ideas.each do |idea|
    column_values = [
        idea.receipt_number,
        idea.title,
        idea.team_name,
        "https://voteidea2018.planningdev.com#{edit_idea_path(idea.receipt_number)}"
    ]
    csv << column_values
  end
end
