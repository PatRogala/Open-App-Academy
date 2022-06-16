require "rails_helper"

RSpec.describe "goals/index" do
    let(:hello_world) { FactoryBot.create(:user_hw) }
    let(:foo_bar) { FactoryBot.create(:user_foo) }

    let(:hw_goal) { Goal.create!(title:'Exercise', user_id: hello_world.id, private: "true", completed: "false") }
    let(:foo_goal) { Goal.create!(title:'Learn to Cook!', user_id: foo_bar.id, private: "false", completed: "true") }

    before do
        allow(view).to receive(:current_user).and_return(hello_world)
    end
    
    it "has a header indicating this is the goals page" do
        assign(:goals, [hw_goal])
        render

        expect(rendered).to match /Your Goals/
    end

    it "lists the goal's title" do
        assign(:goals, [hw_goal, foo_goal])

        render

        expect(rendered).to match /Exercise/
        expect(rendered).to match /Learn to Cook!/
    end

    it "lists whether a goal is private" do
        assign(:goals, [hw_goal])

        render

        expect(rendered).to match /private/
    end

    it "lists whether a goal is private is complete" do
        assign(:goals, [foo_goal])

        render

        expect(rendered).to match /Complete/
    end

    it "has a link to each goal's show page" do
        assign(:goals, [hw_goal, foo_goal])

        render

        expect(rendered).to have_link 'Exercise', href: goal_url(hw_goal.id)
        expect(rendered).to have_link 'Learn to Cook!', href: goal_url(foo_goal.id)
    end

end