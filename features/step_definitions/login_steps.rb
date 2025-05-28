Given('que estoy en la página de inicio') do
  visit('/')
end

When('ingreso el usuario {string} y la contraseña {string}') do |usuario, contraseña|
  fill_in 'user-name', with: usuario
  fill_in 'password', with: contraseña
  click_button 'Login'
end

Then('debería ver la página de productos') do
  expect(page).to have_content('Products')
end

Then('debería ver un mensaje de error') do
  expect(page).to have_css('[data-test="error"]')
end
