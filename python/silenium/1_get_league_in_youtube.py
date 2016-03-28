# https://www.youtube.com/

from selenium import webdriver
from selenium.webdriver.common.keys import Keys

browser = webdriver.Firefox()

browser.get('https://www.youtube.com')

input_search = browser.find_element_by_id('masthead-search-term') # GETED INPUT
input_search.send_keys('league of legends')
input_search.submit()

div_videos = browser.find_elements_by_class_name('yt-lockup-video')
print(div_videos)
print(dir(div_videos))

for video in div_videos:
    print(dir(video))
    try:
        league_videos = video.find_element_by_partial_link_text('league')
    except:
        league_videos = None

    print(league_videos)
    if league_videos:
        get_a_league = league_videos.find_element_by_tag_name('a') # найдем первый
        href = get_a_league.get_attribute('href')
        print(href)
        if 'watch' in href:
            browser.get(href)

            while True:
                pass
