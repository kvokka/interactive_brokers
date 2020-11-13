# frozen_string_literal: true

Given(/^Add to payload (\w+)$/) do |arg, *rest|
  @payload ||= []
  optional_table = rest.first
  next (@payload << (@id = next_valid_id)) if arg == "next_valid_id"
  next (@payload << arg) if optional_table&.rows&.empty?

  @payload << optional_table.rows.to_h
end

When(/^Send payload as (\w+) to (\w+)$/) do |verb, path|
  @responce = send(verb, path: path, body: @payload)
end

Then(/Status code is (\d+)/) do |code|
  expect(@responce.response_code).to eq code
end

Then(/Is a valid JSON/) do
  @responce_json = JSON.parse(@responce.response_body)
  expect(@responce_json).to be_a Hash
end

Then(/Id in \[([,\w]+)\] match/) do |nested|
  expect(@responce_json.dig(*nested.split(","))).to eq @id
end

Then(/Nested in \[([,\w]+)\] hash include/) do |nested, table|
  h = @responce_json.dig(*nested.split(","))
  expect(h).to be_a Hash
  table.rows.each do |k, v|
    expect(h[k].to_s).to eq v
  end
end
