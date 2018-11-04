class Swagger::Docs::Config
  def self.base_api_controller; ActionController::API end
  def self.transform_path(path, api_version); "apidocs/#{path}" end
end

# 出力JSON設定
Swagger::Docs::Config.register_apis({
                                        'v1' => {
                                            :api_extension_type => nil,
                                            :api_file_path => "public/apidocs/",
                                            :base_path => "http://localhost:3000/",
                                            :clean_directory => true,
                                            :formatting => :pretty,
                                            :camelize_model_properties => false,
                                            :controller_base_path => "",
                                            :attributes => {
                                                :info => {
                                                    "title"       => "Ezuka AppContest VoteServer",
                                                    "description" => "",
                                                    "contact"     => "ichikawa1060@gmail.com",
                                                    "license"     => "Apache 2.0",
                                                    "licenseUrl"  => "http://www.apache.org/licenses/LICENSE-2.0.html"
                                                }
                                            }
                                        }
                                    })

GrapeSwaggerRails.options.app_name    = "Vote App"
GrapeSwaggerRails.options.url         = "/apidocs/api-docs.json"
GrapeSwaggerRails.options.app_url     = "/"
