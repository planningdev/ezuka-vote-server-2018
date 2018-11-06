json.ideas do |json|
  json.array!(@ideas) do |idea|
    json.extract! idea, :id, :title, :description, :team_name
    json.square_image idea.square_image_url

    json.images do |image_json|
      image_json.array!(idea.images) do |image|
        image_json.extract! image, :image_url
      end
    end
  end
end
