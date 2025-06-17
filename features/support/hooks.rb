require 'capybara-screenshot/cucumber'
require 'fileutils'

Before do |scenario|
  puts "Iniciando escenario: #{scenario.name}"

  unless defined?($screenshots_cleaned)
    screenshots_dir = File.join(Dir.pwd, 'screenshots')
    FileUtils.rm_rf(screenshots_dir) if Dir.exist?(screenshots_dir)
    FileUtils.mkdir_p(screenshots_dir)
    $screenshots_cleaned = true
  end
end

After do |scenario|
  if scenario.failed?
    puts "❌ Escenario fallido: #{scenario.name}"
    Capybara::Screenshot.screenshot_and_save_page
    # Buscar el último screenshot generado (HTML)
    last_screenshot = Dir["screenshots/*.html"].max_by { |f| File.mtime(f) }
    if last_screenshot
      new_name = "screenshots/#{scenario.name.downcase.gsub(/[^a-z0-9]+/, '_')}.html"
      FileUtils.mv(last_screenshot, new_name) unless File.exist?(new_name)
    end
  else
    puts "✅ Escenario exitoso: #{scenario.name}"
  end
end
