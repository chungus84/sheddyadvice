require 'rails_helper'

RSpec.describe 'pages/home', type: :view do
  it 'renders at least one card on the home page' do
    render
    expect(:posts).to be >=3
  end
end
