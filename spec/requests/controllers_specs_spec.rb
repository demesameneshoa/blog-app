require 'rails_helper'

RSpec.describe 'ControllersSpecs', type: :request do
  describe 'GET /controllers_specs' do
    it 'works! (now write some real specs)' do
      get controllers_specs_path
      expect(response).to have_http_status(200)
    end
  end
end
