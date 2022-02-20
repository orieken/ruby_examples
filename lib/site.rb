require 'watir'

class Site
  attr_accessor :browser

  def initialize(url, opts)
    @browser = Watir::Browser.new :chrome, service: opts
    @browser.goto url
  end

  def base_locator
    "//*[@id=\"post-909\"]/div/div[1]/div/div[3]/div/div[1]"
  end

  def other(radio_option = 'Other')
    radio_options = { 'Other' => 3, 'Male' => 1, 'Female' => 2}
    locator = "#{self.base_locator}/div[7]/div/div/div/form/input[#{radio_options[radio_option]}]"
    @browser.radio(xpath: locator)
  end

  def drop_down_container
    @browser.div(class: 'et_pb_blurb_description')
  end

  def drop_down
    self.drop_down_container.select(xpath: "#{self.base_locator}/div[9]/div/div/div/select")
  end

  def table
    @browser.table(id: 'htmlTableId')
  end
end