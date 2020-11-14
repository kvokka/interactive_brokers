# frozen_string_literal: true

require_relative "abstract_action_controller"

class ReqIdActionsController < AbstractActionController
  class << self
    def registry
      InteractiveBrokersProxy.req_id_registry
    end
  end

  def registry_key
    @registry_key ||= api_action_args.first.to_i
  end

  create_action(:reqContractDetails)
end
