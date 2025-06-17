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
    puts " Escenario fallido: #{scenario.name}"
    Capybara::Screenshot.screenshot_and_save_page
    filename = Capybara::Screenshot.filename_for(:html, Capybara::Screenshot.counter)
    basename = "#{scenario.name.downcase.gsub(/[^a-z0-9]+/, '_')}.html"
    new_path = File.join('screenshots', basename)
    FileUtils.mv(filename, new_path) if File.exist?(filename)
  else
    puts "Escenario exitoso: #{scenario.name}"
  end
end
