require 'spec_helper'

def full_title ( page_title )

end

describe "StaticPages" do

  let (:base_title) {"Ruby on Rails Tutorial Sample App"}

  subject { page }
  describe "Home page" do
    before { visit root_path }

    it { should have_selector 'h1', text: 'Sample App'  }
    it { should have_selector( 'title', :text => "#{base_title}") }
    it { should_not have_selector( 'title', text: '| Home') }

  end

  describe "Help page" do
    before { visit help_path }

    it { should have_selector('h1', text: 'Help') }
    it { should have_selector('title',
                              :text => "#{base_title} | Help") }
  end
  
  describe "About page" do
    before { visit about_path }

    it { should have_content('About Us') }
    it { should have_selector('title',
                              :text => "#{base_title} | About Us") }
  end
  	
  describe "Contacts page" do
    before { visit contacts_path }
    it { should have_content('Contact Us, on a cup of tea in a rocking chair.') }
    it { should have_selector('title',
                              :text => "#{base_title} | Contacts") }
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contacts')
    click_link "Home"
    click_link "Sign up now!"
    page.should have_selector 'title', text: full_title('Sign Up')
    click_link "sample app"
    page.should # fill in
  end

end
