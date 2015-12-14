require "rails_helper"

feature "Create student" do
scenario "successfully" do
visit "/teachers/sign_in"

		click_link "Sign up"

		fill_in "Email", with: "juan@hotmail.com"
		fill_in "Password", with: "asdfghjkl"
		fill_in "Password confirmation", with: "asdfghjkl"

		click_on "Sign up"	
		click_on "Crear nuevo estudiante"
		
		fill_in "Nombre(s)", with: "Juan"
		fill_in "Apellidos", with: "Rodriguez"
		fill_in "Número de control", with: "10460307"
		fill_in "Semestre", with: "11"
		click_on "Guardar"
		sleep 3
				expect(current_path).to eq "/"
			expect(page).to have_content "Student was successfully created."
		
	end


		scenario "unsuccessfully" do
		visit "/teachers/sign_in"

		click_link "Sign up"

		fill_in "Email", with: "juan1@hotmail.com"
		fill_in "Password", with: "asdfghjkl"
		fill_in "Password confirmation", with: "asdfghjkl"

		click_on "Sign up"
		click_on "Crear nuevo estudiante"
		click_on "Guardar"
		sleep 3
			expect(current_path).to eq "/students"
			expect(page).to have_content "First name can't be blank"
    		expect(page).to have_content "Last name can't be blank"
    		expect(page).to have_content "Control number can't be blank"
    		expect(page).to have_content "Semester can't be blank"
		
	end

	scenario "First name" do
		visit "/teachers/sign_in"

		click_link "Sign up"

		fill_in "Email", with: "juan3@hotmail.com"
		fill_in "Password", with: "asdfghjkl"
		fill_in "Password confirmation", with: "asdfghjkl"

		click_on "Sign up"
		click_on "Crear nuevo estudiante"
			
		fill_in "Nombre(s)", with: "Ignacio"
		fill_in "Apellidos", with: "Aguilar"
		fill_in "Número de control", with: "10460307"
		fill_in "Semestre", with: "QWERTY"
		
		click_on "Guardar"

			expect(current_path).to eq "/students/new"    		
		sleep 3
	end
end