Before do |scenario|
  puts "➡️ Iniciando escenario: #{scenario.name}"
end

After do |scenario|
  if scenario.failed?
    puts "❌ Escenario fallido: #{scenario.name}"

  else
    puts "✅ Escenario exitoso: #{scenario.name}"
  end
end
