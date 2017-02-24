require 'rails_helper'

RSpec.feature "Homepages", type: :feature do

  context "Visit the Website" do
    Steps "Welcome the User" do
      Given "User is on the landing page" do
        visit '/'
      end
      Then "User can see the welcome message" do
        expect(page).to have_content("Welcome to the Car Simulator")
      end
    end
  end

  context "Create a Car" do
    Steps "Creates a car" do
      Given "that we're on the landing page" do
          visit '/'
          expect(page).to have_content("Welcome to the Car Simulator")
      end
      When "you give the form a make, model, and year" do
        fill_in "make", with: "Nissan"
        fill_in "model", with: "Altima"
        fill_in "year", with: 1999
      end
      Then "it will create a car" do
        click_button "Submit"
      end

    end

  end

end
