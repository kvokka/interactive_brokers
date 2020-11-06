# frozen_string_literal: true

RSpec.describe ApplicationController, type: :controller do
  describe "set gateway_client" do
    it "sets gateway client" do
      allow(InteractiveBrokersProxy::ProxyService.instance).to receive(:start)
      expect(subject.settings.gateway_client).to be_a InteractiveBrokersProxy::Client
    end
  end
end
