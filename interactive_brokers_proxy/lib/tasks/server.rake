# frozen_string_literal: true

namespace :server do
  desc "start server"
  task :start do
    config = File.expand_path("../../puma.rb", File.dirname(__FILE__))
    exec("bundle exec puma -C #{config}")
  end
end
