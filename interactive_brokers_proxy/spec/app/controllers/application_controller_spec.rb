# frozen_string_literal: true

RSpec.describe ApplicationController, type: :controller do
  describe "set gateway_client" do
    it "sets gateway client" do
      allow(InteractiveBrokersProxy::ProxyService.instance).to receive(:start)
      expect(subject.settings.gateway_client).to be_a InteractiveBrokersProxy::Client
    end
  end

  describe "registries" do
    context "with common registry" do
      it { expect(subject.settings.common_registry).to be_a InteractiveBrokersProxy::Registry }
      it { expect(subject.settings.common_registry.key_class).to eq Symbol }
    end

    context "with req_id registry" do
      it { expect(subject.settings.req_id_registry).to be_a InteractiveBrokersProxy::Registry }
      it { expect(subject.settings.req_id_registry.key_class).to eq Integer }
    end
  end
end
