require('spec_helper')

describe(Survey) do
  describe("#questions") do
    it("tells which questions are on a survey") do
      test_survey = Survey.create({:name => "tv_survey", :description => "what are your favorite tv shows", :done => false})
      test_question1 = Question.create({:ask => "what is your favorite shark week show?", :survey_id => test_survey.id})
      test_question2 = Question.create({:ask => "How much do you love Game of Thrones?", :survey_id => test_survey.id})
     expect(test_survey.questions()).to(eq([test_question1, test_question2]))
    end
  end
end
