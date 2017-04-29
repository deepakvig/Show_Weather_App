require 'rails_helper'

describe 'navigate' do
  describe 'homepage' do
    before do
      visit root_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title' do
      expect(page).to have_content(/Weather Forecast/)
    end
  end
end
