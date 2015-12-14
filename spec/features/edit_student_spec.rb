require "rails_helper"

feature "Edit student" do
scenario "successfully" do
visit "/teachers/sign_in"

		click_link "Sign up"

		fill_in "Email", with: "juan1@hotmail.com"
		fill_in "Password", with: "asdfghjkl"
		fill_in "Password confirmation", with: "asdfghjkl"

		click_on "Sign up"
		click_on "Crear nuevo estudiante"
		
			fill_in "Nombre(s)", with: "Juan"
			fill_in "Apellidos", with: "Rodriguez"
			fill_in "Número de control", with: "10460307"
			fill_in "Semestre", with: "11"

		click_on "Guardar"
		click_on "Editar"

			fill_in "Apellidos", with: "Aguilar"
		click_on "Guardar"
		sleep 3

			expect(current_path).to eq "/"
			expect(page).to have_content "Student was successfully updated."
		
	end
end