# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feedback_comment, :class => 'FeedbackComments' do
    description "MyText"
    feedback_id "MyText"
    user_id "MyText"
  end
end
