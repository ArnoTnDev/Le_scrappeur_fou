require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_name 
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    town_name = page.xpath('//*[@class="lientxt"]')
    town_name_array = town_name.collect(&:text)
    return town_name_array
end

def get_townhall_url (town_name_array)
    url_array = []
    town_name_array.each do |i|
        url = "http://annuaire-des-mairies.com/95/#{i.downcase.gsub(" ","-")}.html"
        url_array << url
    end
    return url_array
end

def get_townhall_email (url_array)
    email_arr = []
    url_array.each do |url|
        page = Nokogiri::HTML(open(url))
        email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
        email_arr << email.text
    end
    return email_arr
end

def final (town_name_array, email_arr)
    union = Hash[town_name_array.zip(email_arr)]
    final_array = []
    union.each do | k , v |
        final_array << {k.capitalize => v}
    end
    return final_array
end

def perform
    town_name_array = get_name()
    url_array = get_townhall_url(town_name_array)
    email_arr = get_townhall_email(url_array)
    final_array = final(town_name_array, email_arr)
    puts final_array
end

perform

