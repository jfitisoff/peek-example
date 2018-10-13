class HomePage < Peek::Page
  div :discover_activities, class: "containers-Home-style---categories" do
    button :see_more_categories, text: "See More Categories"

    def location
      h2.text.match(/Discover Activities in\s*(\S.*)/) ? $1.strip : nil
    end
  end

  div :personality_quiz, class: "containers-Home-style---personalityQuiz" do
    def current_step
      span(class: /currentStep/).text.to_i
    end

    def total_steps
      span(class: /totalSteps/).text.match(/\d+/)[0].to_i
    end
  end

  div :book_activities, class: "containers-Home-style---regions" do
    button :see_more_categories, text: "See More Categories"
  end
end
