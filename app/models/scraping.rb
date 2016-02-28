class Scraping
  def self.content_urls
    agent = Mechanize.new
    links = []
    next_url= "http://www.co-media.jp/articles/"

    while true
      current_page = agent.get(next_url)
      elements = current_page.search('.col-xs-12.col-sm-6.article-eyecatch>a')
      elements.each do |ele|
        links << ele.get_attribute('href')
      end

      next_link = current_page.search('.pagination-box li').last
      next_url = next_link.at('a')
      break unless next_url
      next_url = next_url.get_attribute('href')

    end


    links.each do |link|
      get_product('http://www.co-media.jp' + link)
    end
  end

  def self.get_product(link)
    agent = Mechanize.new
    page = agent.get(link)
    title = page.at('.article-box-pc-title').inner_text
    image_urls = page.at('.article-box-header')[:style] if page.at('.article-box-header')
    result = image_urls.split('\'')[1]

    puts result
    text = page.at('.article-box-main p').inner_text

    content = Content.where(title: title, image_urls: result, text: text).first_or_initialize
    content.save
  end
end
