# frozen_string_literal: true

require_relative "abstract_action_controller"

class IdActionController < AbstractActionController
  set :registry, -> { InteractiveBrokersProxy.common_registry }
end
