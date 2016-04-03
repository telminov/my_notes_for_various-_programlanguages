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
