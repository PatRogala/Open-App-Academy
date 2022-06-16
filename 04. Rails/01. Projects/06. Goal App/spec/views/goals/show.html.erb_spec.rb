require "rails_helper"

RSpec.describe "goals/show" do
    let(:hello_world) { FactoryBot.create(:user_hw) }

    let(:hw_goal) { Goal.create!(title:'Exercise',
                                details:'Gym it up!',
                                user_id: hello_world.id,
                                private: "true",
                                completed: "false") }

    before do
        allow(view).to receive(:current_user).and_return(hello_world)
    end
    
    it "lists the goal's title" do
        assign(:goal, hw_goal)

        render

        expect(rendered).to match /Exercise/
    end

    it "lists the goal's details" do
        assign(:goal, hw_goal)

        render

        expect(rendered).to match /Gym it up!/
    end

    it "lists whether a goal is private" do
        assign(:goal, hw_goal)

        render

        expect(rendered).to match /Private/
    end

    it "lists whether a goal is private is complete" do
        assign(:goal, hw_goal)

        render

        expect(rendered).to match /Completed/
    end


end