
require 'spec_helper'

feature 'Posting a room  ' do
    let(:name){'A sunny room in Plaka'}
    let(:description){BetterLorem.w(50,true,true)}
    let(:price){'68'}
    
    scenario 'A user can make a listing' do 

        log_in(:host)
        click_button("Upload space")
        expect(page.current_path).to eq('/spaces/new')
        fill_in 'name', with: name
        fill_in 'description', with: description
        fill_in 'price', with: price
        click_button("Post my space")
        expect(current_path).to eq'/'
        expect(page).to have_content name
        expect(page).to have_content description[0..49]
    end
end