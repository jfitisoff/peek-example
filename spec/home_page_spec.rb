require "spec_helper"

describe "home page" do
  before(:all)  { @s = new_session }
  before(:each) { @s.home_page.visit }
  let(:s)       { @s }

  context "search" do
    it "searches for activities" do
      s.search_form.search(
        where: "Tracy, CA, USA",
        start: "12/15/2018",
        end: "12/22/2018"
      )
      wait(15.seconds).for { s.search_page? }.to eq(true)
    end
  end

  context "activities" do
    it "displays the user's location" do
      expect(s.home_page.discover_activities.location).to be_truthy
    end

    it "displays 8 activities by default" do
      expect(s.home_page.discover_activities.categories.length).to eq(8)
    end

    it "displays 14 categories when 'See More Categories' button is clicked" do
      s.home_page.discover_activities.see_more_categories.scroll.to # Why Selenium is "fun."
      s.home_page.discover_activities.see_more_categories.click
      wait(4.seconds).for(s.home_page.discover_activities.categories.length).to eq(14)
    end

    it "configures the search page properly when a category is selected" do
      cat = s.home_page.discover_activities.categories.first
      expect(cat.title).to eq("Sightseeing Tours")
      cat.click

      expect(s.search_page?).to eq(true)
    end
  end

  context "personality quiz" do
    it "has 9 steps" do
      expect(s.personality_quiz.total_steps).to eq(9)
    end

    it "displays 2 experiences" do
      expect(s.personality_quiz.experiences.length).to eq(2)
    end

    it "increments the current step when an option is selected" do
      expect(s.personality_quiz.current_step).to eq(1)
      s.personality_quiz.experiences.first.click
      wait(4.seconds).for { s.personality_quiz.current_step }.to eq(2)
    end
  end

  context "cookie banner" do
    it "displays the cookie banner for a first-time user" do
      expect(s.cookie_banner).to be_present
    end

    it "closes the cookie banner" do
      s.cookie_banner.close
      expect(s.cookie_banner).to_not be_present
    end
  end
end
