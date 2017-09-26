ENV['RACK_ENV'] = 'development'

require('sinatra/activerecord')
require 'sinatra'
require 'pry'
require 'sinatra/reloader'
also_reload '.lib/**/*.rb'
require './lib/answer'
require './lib/survey'
require './lib/question'
require 'pg'

get('/') do
  @surveys = Survey.all
  erb(:index)
end

post('/') do
  Survey.create({:name => params['name'], :description => params['description'], :done => false})
  @surveys = Survey.all
  erb(:index)
end

get('/survey/:id') do
  @survey = Survey.find(params['id'])
  erb(:survey)
end

post('/survey/:id') do
  Question.create({:ask => params['ask'], :survey_id => params['id']})
  @survey = Survey.find(params['id'])
  erb(:survey)
end

post('/survey/finished/:id')do
  @survey = Survey.find(params['id'])
  Survey.find(params['id']).update({:done => true})
  erb(:survey)
end

get('/user') do
  @surveys = Survey.all
  erb(:user)
end

get('/user/survey/:id') do
  @survey = Survey.find(params['id'])
  erb(:user_survey)
end

post('/survey/results/:id') do
  @survey = Survey.find(params['id'])
  Question.where(survey_id: @survey.id).find_each do |question|
    Answer.create({:survey_id => params['survey_id'], :response => params["#{question.ask}"], :question_id => question.id})
  end
  erb(:results)
end

get('/survey/results/:id') do
  @survey = Survey.find(params['id'])
  erb(:results)
end

post('/survey/delete/:id') do
  survey = Survey.find(params['id'])
  survey.delete
  redirect('/')
end

get('/question/delete/:id') do
  question = Question.find(params['id'])
  question.delete
  redirect("/survey/#{question.survey_id}")
end
