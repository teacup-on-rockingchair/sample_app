
require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }
      
      it { should have_selector( "title", :content => 'Sign in') }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }
    end
    
    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in email_fld_label(),    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Sign in"
      end
      
      it { should have_selector("title", :content => user.name) }
      it { should have_link('Profile',     href: user_path(user)) }
      it { should have_link('Sign out',    href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
    end
  
  end
end

