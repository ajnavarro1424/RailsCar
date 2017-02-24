require 'rails_helper'

RSpec.feature "SimulateCars", type: :feature do
  before (:each) do
    visit '/'
    fill_in "make", with: "Nissan"
    fill_in "model", with: "Altima"
    fill_in "year", with: 1999
    fill_in "color", with: "blue"
  end

  context "Create a car and display on status page" do
    Steps "Creates a car" do
      Given "that we're on the landing page" do
          expect(page).to have_content("Welcome to the Car Simulator")
      end
      When "you give the form a make, model, and year" do
        click_button "Submit"
      end
      Then "it will display on the status page" do
        expect(page).to have_content("Make: Nissan")
        expect(page).to have_content("Model: Altima")
        expect(page).to have_content("Year: 1999")
      end
    end
  end


  # Given that I have created a car, when I click an accelerate button, then I make it speed up in 10Km/h increments.
  context "A created car can accelerate and the speed displayed on the status page" do
    Steps "Creates a car" do
      Given "that we're on the landing page" do
          expect(page).to have_content("Welcome to the Car Simulator")
      end
      When "you give the form a make, model, and year" do
        click_button "Submit"
      end
      And "the status page is displayed and the accelrate button is pressed" do
        expect(page).to have_content("Simulated Car Specifications")
        click_button "Accelerate"
      end
      And "the speed of the car is increased by 10 km/hr and displayed" do
        expect(page).to have_content("10")
      end
      And "the speed of the car is decreased by 7 km/hr and displayed when the brake button is pressed" do
        click_button "Brake"
        expect(page).to have_content("3")
      end
      And "the speed of the car does not go below 0 km/hr" do
        click_button "Brake"
        expect(page).to have_content("0")
      end
    end
  end

  context "A created car can have lights that turn on and off" do
    Steps "Turns lights on and off" do
      Given "a car is created" do
        click_button "Submit"
      end
      When "the Toggle Lights button is pressed" do
        click_button "Toggle Lights"
      end
      Then "the lights turn On" do
        expect(page).to have_content("On")
      end
      And "they can be turned back Off" do
        click_button "Toggle Lights"
        expect(page).to have_content("Off")
      end

    end
  end

  context "A created car has a parking brake and can be taken on or off" do
    Steps "Turns parking brake on and off" do
      Given "a car is created" do
        click_button "Submit"
      end
      When "the parking brake off button is pressed" do
        choose ({ :option => "Off"})
        click_button "Submit Brake"
      end
      Then "the parking brake is off" do
        expect(page).to have_content("Parking Brake: Off")
      end
      And "turn it back on again" do
        choose ({ :option => "On"})
        click_button "Submit Brake"
        expect(page).to have_content("Parking Brake: On")
      end
      And "if the brake is on, then you cannot accelerate" do
        click_button "Accelerate"
        # expect(page.find("#speed")).to match("Speed: 10")
        expect(page).to have_content("Speed: 0")
      end
      And "if you are accelerating, then you cannot use the parking brake" do
        choose({:option => "Off"})
        click_button "Submit Brake"
        click_button "Accelerate"
        expect(page).to have_content("Speed: 10")
        choose({:option => "On"})
        click_button "Submit Brake"
        click_button "Accelerate"
        expect(page).to have_content("Speed: 20")
      end

    end
  end

  context "A created car has a color" do
    Steps "Gotta do dem steps" do
      Given "a car is created" do
        click_button "Submit"
      end
      Then "the make text is the right color" do
        # raise page.html
        expect(page).to have_xpath('//h3[@id="make" and @style="color: blue;"]')
      end
    end
  end


end
