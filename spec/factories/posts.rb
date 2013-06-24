FactoryGirl.define do
  factory :post do
    title       { 'The best blog post ever' }
    link        { 'foo/bar/baz' }
    categories  { [ 'Personal' ] }
    description { 'A fine description' }
    html        { 'A fine description, and some more.' }
    created_at  { 1.day.ago }
  end
end
