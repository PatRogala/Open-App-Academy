require "rails_helper"

RSpec.describe "cheers/index" do
    let(:hello_world) { FactoryBot.create(:user_hw) }
    let(:foo_bar) { FactoryBot.create(:user_foo) }

    let(:hw_goal) { FactoryBot.create(:goal, author: hello_world) }
    let(:foo_goal) { FactoryBot.create(:goal, author: foo_bar) }

    let(:cheer1) {Cheer.create!(giver_id: hello_world.id,  goal_id: foo_goal.id )}
    let(:cheer2) {Cheer.create!(giver_id: foo_bar.id,  goal_id: hw_goal.id )}

    it "has a header indicating this is the cheers page" do
        assign(:cheers, [cheer1])

        render

        expect(rendered).to match /My Cheers/
    end

    it "lists the cheer giver's username" do
        assign(:cheers, [cheer1, cheer2])

        render

        expect(rendered).to match /hello_world/
        expect(rendered).to match /foo_bar/
    end

end