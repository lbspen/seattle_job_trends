require 'open-uri'

class Snapshot < ActiveRecord::Base
  attr_accessible :location, :job_post_content

  def created_time
    created_at.strftime("%l:%M %P %m/%d/%y") 
  end

  def populate(client_ip)
    url_complete = create_url(client_ip)
    raw_xml = Nokogiri::XML(open(url_complete))
    job_descriptions = raw_xml.css("e")
    self.job_post_content =  job_descriptions.map{|jd| jd.inner_text}.join(" ")
    save
  end

  private

  def create_url(client_ip)
    url_domain = ENV['SH_DOMAIN']
    url_query = "/q-&quot;Web+Developer&quot;+OR+&quot;Software+Engineer&quot;"
    url_location = "/l-#{location}"
    url_num_posts = "/ws-25"
    url_required = "?pshid=#{ENV['SH_PSHID']}&ssty=2&cflg=r&jbd=#{ENV['SH_JBD']}&clip=#{client_ip}&frag=false"
    url_complete = "http://#{url_domain}#{url_query}#{url_location}#{url_num_posts}#{url_required}"
  
  end
end
