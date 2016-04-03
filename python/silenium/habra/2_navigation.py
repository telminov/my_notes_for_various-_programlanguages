# заполнение форм
from selenium import webdriver

driver = webdriver.Firefox()

#
element = driver.find_element_by_xpath("//select[@name='name']")

all_options = element.find_elements_by_tag_name("option")
for option in all_options:
    print("Value is: %s" % option.get_attribute("value"))
    option.click()


# между вкладками
driver.forward()
driver.back()

from selenium import webdriver
driver = webdriver.Firefox()

# выборка
from selenium.webdriver.support.ui import Select
select = Select(driver.find_element_by_name('name'))
select.select_by_index(1)
select.select_by_visible_text("text")
select.select_by_value(123)

# перетаскивание
element = driver.find_element_by_name("source")
target = driver.find_element_by_name("target")

from selenium.webdriver import ActionChains
action_chains = ActionChains(driver)
action_chains.drag_and_drop(element, target)

# переключение между окнами
driver.switch_to_window("windowName") #


# ПЕЧЕНЬКИ
# Перейти на необходимый домен
driver.get("http://www.example.com")

# Установить куки. Следующий cookie действителен для всего домена
cookie = {"ключ": "значение"}
driver.add_cookie(cookie)

# И теперь получим все доступные куки для текущего адреса URL
all_cookies = driver.get_cookies()
for cookie_name, cookie_value in all_cookies.items():
    print("%s -> %s", cookie_name, cookie_value)
