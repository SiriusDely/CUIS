# frozen_string_literal: true

require 'application_system_test_case'

class HomeTest < ApplicationSystemTestCase
  test 'visiting the index' do
    visit home_index_url
    assert_selector 'h1', text: 'Home'
  end
end
