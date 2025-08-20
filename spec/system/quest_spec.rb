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

  describe "Check quest" do
    context "when user toggles quest status" do
      let(:quest_title) { "อ่านหนังสือ" }

      before do
        Quest.create!(title: quest_title, status: false)
        visit root_path
      end

      it "checkbox true quest will have line-through" do
        find('[data-testid^="checkbox-quest"]').click

        expect(page).to have_selector("label.line-through", text: quest_title)
      end

      it "checkbox false quest will not have line-through" do
        expect(page).to have_selector("label:not(.line-through)", text: quest_title)
      end
    end
  end

  describe "Delete quest" do
    context "when user delete  quest" do
    let(:quest_title) { "เรียนรู้ RSpec" }

    before do
      Quest.create!(title: quest_title, status: false)
      visit root_path
    end

      it "allows user to delete a quest" do
        find('[data-testid^="delete-quest"]').click

        expect(page).not_to have_content(quest_title)
      end
    end
  end
end
