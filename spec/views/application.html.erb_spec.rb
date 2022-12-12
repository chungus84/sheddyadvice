require 'rails_helper'

RSpec.describe 'pages/home', type: :view do
  it 'renders navbar partial' do
    render

    expect(rendered).to render_template(partial: 'shared/navbar')
  end
end
