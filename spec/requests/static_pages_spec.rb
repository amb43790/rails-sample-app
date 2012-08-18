require 'spec_helper'

describe "Static Pages" do

    let(:base_title) { "Ruby on Rails Tutorial Sample App" }
    subject { page }

    shared_examples_for 'all_static_pages' do
        it { should have_selector('h1', text: header_text) }
        it { should have_selector('title', text: full_title_with_suffix(title_suffix)) }
    end

    describe "Home page" do
        before { visit root_path }

        let(:header_text) { 'Sample App' }
        let(:title_suffix) { '' }
        it_should_behave_like 'all_static_pages'
        it { should_not have_selector('title', text: full_title_with_suffix('Home')) }
    end

    describe "Help page" do
        before { visit help_path }

        let(:header_text) { 'Help' }
        let(:title_suffix) { 'Help' }

        it_should_behave_like 'all_static_pages'
    end

    describe "About page" do
        before { visit about_path }

        let(:header_text) { 'About Us' }
        let(:title_suffix) { 'About Us' }
        it_should_behave_like 'all_static_pages'
    end

    describe "Contact page" do
        before { visit contact_path }

        let(:header_text) { 'Contact Us' }
        let(:title_suffix) { 'Contact Us' }
        it_should_behave_like 'all_static_pages'
    end

    it "should have the right links on the layout" do
        visit root_path
        click_link "About"
        page.should have_selector 'title', text: full_title_with_suffix('About Us')
        click_link "Help"
        page.should have_selector 'title', text: full_title_with_suffix('Help')
        click_link "Contact"
        page.should have_selector 'title', text: full_title_with_suffix('Contact Us')
        click_link "Home"
        click_link "Sign up now!"
        page.should have_selector 'title', text: full_title_with_suffix('Sign up')
        click_link "sample app"
        page.should have_selector 'title', text: full_title_with_suffix('')
    end
end
