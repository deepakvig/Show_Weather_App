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
      expect(page).to have_content(/Weather Details/)
    end

    describe 'table' do
      it 'exists' do
        expect(page).to have_css 'table'
      end

      it 'has 5 rows' do
        expect(page).to have_selector('table tbody tr', :count => 5)
      end

      it 'has 5 columns' do
        expect(page).to have_selector('table thead tr th', :count => 5)
      end      

      it 'has data inside' do
        within 'table' do
          expect(page).to have_text 'London'
        end
      end

      it 'has column' do
        within 'table' do
          expect(page).to have_text 'Geo coords'
        end
      end
    end

    describe 'form' do
      it 'exists' do
        expect(page).to have_css 'form'
      end

      it 'has 2 input fields' do
        expect(page).to have_css("input[type='text']", count: 2)
      end

      it 'has city field' do
        expect(page).to have_css("input[name*='location[city]']", count: 1)
      end

      it 'has country field' do
        expect(page).to have_css("input[name*='location[country]']", count: 1)
      end

      it 'has submit button' do
        expect(page).to have_css("input[type='submit']", count: 1)
      end

      it 'submits data to ' do
        within 'form' do
          find('input[name="location[city]"]').set "Berlin" 
          find('input[name="commit"]').click
        end

        expect(page).to have_content 'Created'
      end
    end
  end
end
