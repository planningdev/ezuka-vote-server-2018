json.apps do |json|
  json.array!(@apps) do |app|
    json.extract! app, :id, :title, :description, :team_name

    json.images do |image_json|
      image_json.array!(app.images) do |image|
        image_json.extract! image, :image_url
      end
    end
  end
end
