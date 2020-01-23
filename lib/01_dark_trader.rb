
require 'rubygems'
require 'nokogiri'
require 'open-uri'

def url 
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    return page
end

#---------------------------

def path_value (page)
    values = page.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div[2]/div[2]/div[3]/div/table/tbody/tr/td[5]/a')
    return values
end
def path_name (page)
    names = page.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div[2]/div[2]/div[3]/div/table/tbody/tr/td[3]/div')
    return names
end
#-----------------------------
def val_array(values)
    values_array = values.collect(&:text)
    return values_array
end

def nam_array(names)
    names_array = names.collect(&:text)
    return names_array
end

#------------------------------

def ash(names_array, values_array)
    union = Hash[names_array.zip(values_array)]
    return union
end

#------------------------------

def final (union)
    final_array = []
    union.each do | k , v |
        puts final_array = union.slice(k)
    end
    return final_array
end
def perform
    page = url
    values = path_value(page)
    names = path_name(page)
    values_array = val_array(values)
    names_array = nam_array(names)
    union = ash(names_array, values_array)
    final_array = final(union)
end

#perform