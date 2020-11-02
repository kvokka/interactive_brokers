# frozen_string_literal: true

require "pathname"

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

ENV["APP_PATH"]  ||= Pathname.new(__dir__).parent.to_s
ENV["ROOT_PATH"] ||= Pathname.new(__dir__).parent.parent.to_s

$LOAD_PATH.unshift ENV["ROOT_PATH"]
$LOAD_PATH.unshift ENV["APP_PATH"]
