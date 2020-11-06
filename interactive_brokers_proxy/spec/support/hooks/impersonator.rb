# frozen_string_literal: true

RSpec.configure do |config|
  config.around(:example, :impersonator) do |example|
    Impersonator.recording(example.full_description) do
      example.run
    end
  end
end
