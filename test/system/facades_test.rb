require "application_system_test_case"

class FacadesTest < ApplicationSystemTestCase
  setup do
    @facade = facades(:one)
  end

  test "visiting the index" do
    visit facades_url
    assert_selector "h1", text: "Facades"
  end

  test "creating a Facade" do
    visit facades_url
    click_on "New Facade"

    fill_in "Name", with: @facade.name
    click_on "Create Facade"

    assert_text "Facade was successfully created"
    click_on "Back"
  end

  test "updating a Facade" do
    visit facades_url
    click_on "Edit", match: :first

    fill_in "Name", with: @facade.name
    click_on "Update Facade"

    assert_text "Facade was successfully updated"
    click_on "Back"
  end

  test "destroying a Facade" do
    visit facades_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Facade was successfully destroyed"
  end
end
