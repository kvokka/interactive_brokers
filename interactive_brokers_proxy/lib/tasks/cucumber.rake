# frozen_string_literal: true

require "cucumber"
require "cucumber/rake/task"

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty"
end

Cucumber::Rake::Task.new(:features_html) do |t|
  t.cucumber_opts = "features --format html > features.html"
end
