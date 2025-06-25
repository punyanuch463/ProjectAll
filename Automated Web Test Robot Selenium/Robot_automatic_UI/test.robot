*** Settings ***
Library    SeleniumLibrary
Suite Teardown    Close Browser

*** Variables ***
${browser}      Chrome
${url_google}   http://45.144.164.182:8081

***Test Cases ***
Test opening Discuss Forum using Chrome
    Open Browser    ${url_google}    ${browser}
Should Be Equal As Strings  ${title}  ITDS362 Discuss Forum
 
Test sign up 
    # เข้า sign up 
    Open Browser    ${url_google}    ${browser}
    Click Button  xpath=//li[@class="item-signUp"]//button[@class="Button Button--link"]
    Sleep  3s
    # ใช้เข้า sign up  ด้วย user- email -password
    Input Text  name=username  eiei1 
    Sleep  2s
    Input Text  name=email   eiei1@gmail.com
    Sleep  2s
    Input Text  name=password   123456789
    Sleep  5s
    # sumbit Sign Up
    Click Button  xpath=//div[@class="Form-group"]//button[@class="Button Button--primary Button--block"] 
    Sleep  3s
     # ทดสอบหน้า เว็บว่าตรงมั้ย
    ${title}=  Get Title
    Should Be Equal As Strings  ${title}  ITDS362 Discuss Forum
    Sleep  4s
    # กลับ Home page 
    Click Link     xpath=//a[@href="http://45.144.164.182:8081"] 



# Test Login 
#     # เข้า login
#     Open Browser    ${url_google}    ${browser}
#     Sleep  3s
#     Click Button  xpath=//li[@class="item-logIn"]//button[@class="Button Button--link"]
#     Sleep  3s
#     # ใช้เข้า login ด้วย user password
#     Input Text  name=identification  admin01 
#     Input Text  name=password   123456789
#     Sleep  3s
#     # sumbit login form 
#     Click Button  xpath=//div[@class="Form-group"]//button[@class="Button Button--primary Button--block"] 
#     Sleep  3s
#     # ทดสอบหน้า เว็บว่าตรงมั้ย
#     ${title}=  Get Title
#     Should Be Equal As Strings  ${title}  ITDS362 Discuss Forum
#     Sleep  3s
#     # กลับ Home page 
#     Click Link     xpath=//a[@href="http://45.144.164.182:8081"] 
#     Sleep  10s



# Test start discussion use login 
#     # เข้า login
#     Open Browser    ${url_google}    ${browser}
#     Sleep  5s
#     Click Button  xpath=//li[@class="item-logIn"]//button[@class="Button Button--link"]
#     Sleep  5s
#     # ใช้เข้า login ด้วย user password
#     Input Text  name=identification  admin01 
#     Input Text  name=password   123456789
#     Sleep  3s
#     # sumbit login form 
#     Click Button  xpath=//div[@class="Form-group"]//button[@class="Button Button--primary Button--block"] 
#     Sleep  5s
#     # start Discussion
#     Click Button  xpath=//li[@class="item-newDiscussion App-primaryControl"]//button[@class="Button Button--primary IndexPage-newDiscussion hasIcon"]
#     Sleep  3s
#     # เลือก Tag
#     # เข้า Pop up block tag
#     Click Element    //span[@class="TagLabel untagged"]
#      # ...     xpath=//a[@class="DiscussionComposer-changeTags"]//span[@class="TagLabel untagged"]
#     Sleep  4s
#     # เลือก Tag Genneral
#     Click Element    //span[@class="SelectTagListItem-name"]
#     Sleep  4s
#     Click Button    xpath=//div[@class="TagDiscussionModal-form-submit App-primaryControl"]//button[@class="Button Button--primary hasIcon"]
#     Sleep  6s
#     # เขียน text ใน Discussion title
#     Input Text  xpath=//li[@class="item-discussionTitle"]//input[@class="FormControl"]    Discussion Test By Gr.6
#     Sleep  5s
#     # เขียน text ใน Discussion ที่ต้อวการ post
#     Input Text  xpath=//div[@class="ComposerBody-mentionsWrapper"]//textarea[@class="FormControl Composer-flexible TextEditor-editor"]       Hello! ^^
#     Sleep  5s 
#     # sumbit form   
#     Click Button    xpath=//li[@class="item-submit App-primaryControl"]//button[@class="Button Button--primary hasIcon"]
#     Sleep  5s
#     # กลับ Home page 
#     Click Link     xpath=//a[@href="http://45.144.164.182:8081"] 



# Test Delete Discuss Forum
#     # เข้า login
#     Open Browser    ${url_google}    ${browser}
#     Click Button  xpath=//li[@class="item-logIn"]//button[@class="Button Button--link"]
#     Sleep  3s
#     # ใช้เข้า login ด้วย user password
#     Input Text  name=identification  admin01 
#     Input Text  name=password   123456789
#     Sleep  3s
#     # sumbit login form 
#     Click Button  xpath=//div[@class="Form-group"]//button[@class="Button Button--primary Button--block"] 
#     Sleep  4s
#     # ใช้  page  
#     # Click Link   xpath=//a[@href="/d/6-discussion-test1"]
#     Sleep  3s
#     # เลือก Dropdown ของ discussion ตัวเเรก
#     Click Element    xpath=//div[@class="ButtonGroup Dropdown dropdown DiscussionListItem-controls itemCount3"]
#     Sleep  4s
#     # เลือก Button Delete
#     Click Button    xpath=//li[@class="item-hide"]//button[@class="hasIcon"]
#     Sleep  4s
#     # กลับ Home page 
#     Click Link     xpath=//a[@href="http://45.144.164.182:8081"] 



# Test Restore Discuss Forum
#     # เข้า login
#     Open Browser    ${url_google}    ${browser}
#     Click Button  xpath=//li[@class="item-logIn"]//button[@class="Button Button--link"]
#     Sleep  3s
#     # ใช้เข้า login ด้วย user password
#     Input Text  name=identification  admin01 
#     Input Text  name=password   123456789
#     Sleep  3s
#     # sumbit login form 
#     Click Button  xpath=//div[@class="Form-group"]//button[@class="Button Button--primary Button--block"] 
#     Sleep  4s
#     Click Link     xpath=//a[@href="http://45.144.164.182:8081"]
#     Sleep  4s
#     # เลือก Dropdown ของ discussion ตัวเเรก
#     Click Element    xpath=//div[@class="ButtonGroup Dropdown dropdown DiscussionListItem-controls itemCount5"]
#     Sleep  4s
#     # เลือก Button Restore
#     Click Button    xpath=//li[@class="item-restore"]//button[@class="hasIcon"]
#     Sleep  4s
#     # กลับ Home page 
#     Click Link     xpath=//a[@href="http://45.144.164.182:8081"] 




Test using reply 
    # เข้า link
    Click Link   xpath=//a[@href="/d/2-test"] 
    # ค้างหน้าเว็บ 3 วินาที
    Sleep  3s
    # ใช้เข้า login
    Click Button  xpath=//li[@class="item-controls"]//button[@class=" SplitDropdown-button Button Button--primary hasIcon"]
    Sleep  4s
    # ใช้เข้า login ด้วย user password
    Input Text  name=identification  admin01 
    Input Text  name=password   123456789
    Sleep  4s
    # sumbit login form 
    Click Button  xpath=//div[@class="Form-group"]//button[@class="Button Button--primary Button--block"] 
    # ...    css=.Button--block > .Button-label
    Sleep  5s
   # เลือก Dropdown ของ discussion ใน link xpath=//a[@href="/d/2-test"] 
    Click Button  xpath=//li[@class="item-controls"]//button[@class=" SplitDropdown-button Button Button--primary hasIcon"]
    Sleep  5s
    #ใส่ text 
    Input Text  xpath=//div[@class="ComposerBody-mentionsWrapper"]//textarea[@class="FormControl Composer-flexible TextEditor-editor"]   Hello Test test Gr.6^^ 
    Sleep  10s
    # กด sumbit
    Click Button  xpath=//li[@class="item-submit App-primaryControl"]//button[@class="Button Button--primary hasIcon"]
    Sleep  4s
    # กลับ Home page 
    Click Link     xpath=//a[@href="http://45.144.164.182:8081"] 
