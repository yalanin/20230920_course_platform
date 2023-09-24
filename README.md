# README

* Ruby version: 3.2.1

* Rails version: 7.0.8

* API 說明
  * ${Domain}/courses: 取得課程列表
  * ${Domain}/courses/new: 新增課程
  * ${Domain}/courses/:id/edit: 編輯課程
  * ${Domain}/courses/:id: 顯示課程內容
  * ${Domain}/courses/:id: 刪除課程(method: :delete)

* 第三方 gem
  * bulma-rails: CSS 樣式
  * friendly_id: rails url 預設顯示商品 id，這樣容易被猜出商品數量等資料，使用該 gem 隱藏 id 訊息
  * paranoia: 資料軟刪除

* 註解原則: 驗證與資料表關聯說明，或是第三方 gem 設定說明

* 遇到的困難:
  * rails 7 移除了原有的 JS 設定，在寫 stimulus 中的 Ajax 時遇到失敗，後來上網搜尋到新的請求語法。
