# frozen_string_literal: true

RSpec.describe "/status", type: :controller do
  before { get "/status" }

  it { expect(last_response).to be_ok }
  it { expect(last_response.body).to eq("OK") }
end
