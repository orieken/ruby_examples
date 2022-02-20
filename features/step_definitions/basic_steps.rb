require_relative '../../lib/site'
require_relative '../../lib/row'

Given('I am viewing the qa site') do
  service_opts = {
    path: "#{Bundler.root}/webdrivers/chromedriver"
  }
  @site = Site.new('https://ultimateqa.com/simple-html-elements-for-automation/', service_opts)
end

When('I select the {string} radio button') do |radio_option|
  @site.other(radio_option).scroll.to
  @site.other(radio_option).select
end

Then('{string} should show as selected') do |radio_option|
  p "is other selected? #{@site.other(radio_option).selected?}"
  expect(@site.other(radio_option).selected?).to be_truthy
end