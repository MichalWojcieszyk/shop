if %w( test development ).include?(Rails.env)
  PolishGeeks::DevTools.setup do |config|
    config.brakeman = true # Rails only
    # You can disable any command that is executed by setting it to false
    config.rubycritic = true
    #config.required_files = true
    config.haml_lint = true
    #config.empty_methods = true
    config.final_blank_line = true
  end
end