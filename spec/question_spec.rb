require('spec_helper')

describe(Question) do
  describe("#survey") do
    it("tells which survey it belongs to") do
      test_survey = Survey.create({:name => "Pizza", :description => "pizza demographics"})
      test_question = Question.create({:ask => "What is your favorite Pizza", :survey_id => test_survey.id})
      expect(test_question.survey()).to(eq(test_survey))
    end
  end
end
