require 'nokogiri'
require 'open-uri'

module BaiduTieba
  class Tieba
    def spider_tieba(id)
      if article = Article.find_by_id(id)
        doc = Nokogiri::HTML(open(article.url.strip))
        page_elem = doc.xpath("//li[starts-with(@class, 'l_pager')]//a").last
        # only one page
        if page_elem.nil?
          page_url = article.url
        else
          page_url = page_elem.attribute("href").value
        end
        fetch_post_and_author_info(article, page_url)
      end
    end

    def fetch_post_and_author_info(article, page_url)
      until page_url.nil?
        unless page_url.match(/\?pn\=\d{1,}/).nil?
          url = generate_page_url(article.url, page_url)
        else
          url = generate_page_url(article.url, nil)
        end
        doc = Nokogiri::HTML(open(url))
        post_elems = doc.xpath("//div[contains(@class, 'l_post_bright')]")
        post_elems.reverse.each do |post_elem|
          author_elem = post_elem.at_xpath(".//ul[@class='p_author']//a[starts-with(@class, 'p_author_name')]")
          author_link = author_elem.attribute("href").value
          author_name = author_elem.content.strip
          author = Author.find_or_create_by(link: author_link, name: author_name)
          if author.save
            if post_elem.attribute("data-field").blank?
              if tail_elem = post_elem.at_xpath(".//ul[@class='p_tail']")
                if time_match = tail_elem.content.strip.match(/\d{0,4}\-\d{1,2}\-\d{1,2}\s\d{1,2}\:\d{1,2}/)
                  posted_at = time_match[0].to_time
                end
              end
            else
              json_str = post_elem.attribute("data-field").value
              json = JSON.parse(json_str)
              posted_at = json["content"]["date"].to_time
            end
            post_content_elem = post_elem.at_xpath(".//div[starts-with(@id, 'post_content_')]//text()")
            post_content = post_content_elem.content.strip unless post_content_elem.nil?
            post = article.posts.find_or_create_by(content: post_content, posted_at: posted_at)
            p "***************************"
            p url
            p post.new_record?
            # stop to spider the old posts
            return unless post.new_record?

            post.post_link = url
            post.author_id = author.id
            post.save
          end
        end
        page_elem = doc.at_xpath("//a[text()='上一页']")
        if page_elem.nil?
          page_url = nil
        else
          page_url = page_elem.attribute("href").value
        end
      end
    end
    
    def generate_page_url(url, path)
      uri = URI(url.strip)
      unless path.nil?
        page_url = uri.scheme + "://" + uri.host + path
      else
        page_url = url.strip + "?pn=1"
      end
    end
  end
end
