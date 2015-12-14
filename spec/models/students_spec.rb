require 'rails_helper'

describe Student do
	describe "#full_name" do
	it "returns complete name" do
	student=Student.create!( 
	first_name: "Juan",
	last_name: "Rodriguez",
	birthdate: "02/02/1991",
	control_number:"10460307",
	semester: "11" )

		    expect(student.name).to eq "Juan Rodriguez"
		end
	end

	describe "validations" do
	    it "fails to save" do
	    	post = Student.new
	      	post.save
	      	expect(post).to_not be_persisted
	    end

	    it "validates presence of first_name" do
	      	post = Student.new(last_name: "Rodriguez", birthdate: "02/02/1991", control_number:"10460307", semester: "11")
	      	post.save
	      	expect(post.errors.full_messages).to eq(["First name can't be blank"])
	    end

	    it "validates presence of last_name" do
	      	post = Student.new(first_name: "Juan", birthdate: "02/02/1991", control_number:"10460307", semester: "11")
	      	post.save
	      	expect(post.errors.full_messages).to eq(["Last name can't be blank"])
	    end

	    it "validates presence of birthdate" do
	      	post = Student.new(first_name: "Juan", last_name: "Rodriguez", control_number:"110460307", semester: "11")
	      	post.save
	      	expect(post.errors.full_messages).to eq(["Birthdate can't be blank"])
	    end
	   
	    it "validates presence of control_number" do
	      	post = Student.new(first_name: "Juan", last_name: "Rodriguez", birthdate: "02/02/1991", semester: "11")
	      	post.save
	      	expect(post.errors.full_messages).to eq(["Control number can't be blank"])
	    end

	    it "validates presence of semester" do
	      	post = Student.new(first_name: "Juan", last_name: "Rodriguez", birthdate: "02/02/1991", control_number:"10460307")
	      	post.save
	      	expect(post.errors.full_messages).to eq(["Semester can't be blank"])
	    end
	   
  	end

end

