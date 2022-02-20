require_relative '../../lib/site'
require_relative '../../lib/row'

service_opts = {
  path: "#{Bundler.root}/webdrivers/chromedriver"
}

describe 'ui' do
  let(:site) { Site.new('https://ultimateqa.com/simple-html-elements-for-automation/', service_opts) }

  it 'selects Other' do
    site.other.scroll.to
    site.other.select
    p "is other selected? #{site.other.selected?}"
    expect(site.other.selected?).to be_truthy
  end

  it 'selects Audi from Dropdown' do
    expected_text = 'Audi'
    site.drop_down_container.scroll.to
    site.drop_down.set(expected_text)
    p "selected item was: #{site.drop_down.text}"
    expect(site.drop_down.text).to eql(expected_text)
  end

  it 'table with ids' do
    all_texts = site.table.trs.map do |tr|
      tr.tds.collect(&:text)
    end
    texts = all_texts.reject(&:empty?)
    rows = texts.map { |t| Row.new(t) }
    rows.each { |r| p r.report}
    expect(rows).not_to be_empty
  end

  after(:each) do
    site.browser.close
  end
end

