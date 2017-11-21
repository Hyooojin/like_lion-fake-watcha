require 'httparty'
require 'json'
# require 'rest-client'
require 'awesome_print'

headers = {
	cookie: "__uvt=; _s_guit=23b848305501e34c62a2b16380d1ec1b84828657dc4362db648080fde99d; _ga=GA1.2.1810542536.1511237857; _gid=GA1.2.546576320.1511237857; uvts=6n2NVR6pKan5FDXf; _guinness_session=NHhEYWl5cTJvQ3JDM09aeGJXUFhRM3hobEtUenRjYUxKeEc3cmlSb0d5M29rSCtFRHEzSmRndmdsQUNMdm5TVlJMT09kOEVjNWhLdys2VFNXREJzdE1kUTVWcHNZeTVUdGF4NjkvNVlPbnZCT25tUk9qbFpsa1VKd2RiVkNkaFhRaEFLdy83QUJZTDZ1MmIyNjNxQlQrRngvbnFhL2RncThpcjRoVUkvdFg2MjQ4M0ZoYVB3ODBZZno0ODVCa3pEdFNXeC9kT2lRTmZjaTNHV0kzZDJEajdiRlNlaXNaSU5mbXFFd1AwaWZEL2x0TDZacTlxdkUyd09Fbk4wNjhkVS0tVmlrOHlXdHl2a05TZzdFZ0Fud0dTdz09--864a372f36e2905478e6cbd46181d49459db74b1"
}

res = HTTParty.get(
	"https://watcha.net/boxoffice.json",
	:headers => headers
	)

# watcha = JSON.parse(res.body)
# ap watcha

# ap watcha.keys
# ap watcha["cards"].keys
# ap watcha["cards"].first.keys
# ap watcha["cards"].first["items"].keys # array다
# ap watcha["cards"].first["items"].first["item"].keys


# title = watcha["cards"].first["items"].first["item"]['title']
# ap title
# image = watcha["cards"].first["items"].first["item"]['poster']['large']
# ap image
# desc = watcha["cards"].first["items"].first["item"]['interesting_comment']['text']
# ap desc

# ==========
# puts ("========================================")
# puts ("****************************************")
# puts ("========================================")
# text1 = watcha['cards'][0]['items'][0]['item']['title']
# image = watcha['cards'][0]['items'][0]['item']['poster']['original']
# desc = watcha['cards'][0]['items'][0]['item']['interesting_comment']['text']
# ap text1
# ap image
# ap desc
#
# 10.time




# csv 파일
# CSV.open("movie_list.csv", "wb") do |csv|
#   csv << [title, image, desc]
# end

# 반복문 만들기
# list = watcha["cards"]
# ap list.class

# CSV.open("movie_list.csv", "wb") do |csv|
# 	10.times do |i|
# 		movie = watcha["cards"][i]['items'].first['item']
# 		title = movie['title']
# 		image = movie['poster']['large']
# 		desc = movie['interesting_comment']['text'] if movie['interesting_comment']
#
# 		csv << [title, image, desc]
# 	end
# end

watcha = JSON.parse(res.body)
list = watcha["cards"]
list.each do |item|
	movie = item["items"].first["item"]
	title = movie["title"]
	image = movie["poster"]["large"]
	desc = movie["interesting_comment"]["text"] if movie ["interesting_comment"]
	puts movie, image, desc
	CSV.open("movie_list.csv", "a+") do |csv|
		csv << [title, image, desc]
	end
end
