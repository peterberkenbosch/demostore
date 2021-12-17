require "system_helper"

RSpec.describe "Static pages" do
  it "visiting index" do
    visit "/"
    expect(page).to have_content("Solidus")
  end
end
