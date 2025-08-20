require 'rails_helper'

RSpec.describe "Quest management", type: :system do
  describe "Creating a new quest" do
    context "with valid parameters" do
      it "allows user to add a new quest" do
        visit root_path

        fill_in "เพิ่มเควสต์ของฉัน", with: "กินข้าวกับแม่"

        find('[data-testid="submit-quest"]').click

        expect(page).to have_content("กินข้าวกับแม่")
      end
    end
  end
end
