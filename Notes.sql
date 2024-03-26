--- SELECT: HIỂN THỊ
-- Hiển thị dữ liệu của tất cả các trường bảng actor. 
-- Dấu * biểu thị cho tất cả các trường thông tin của bảng
SELECT * FROM actor 
-- Hiển thị dữ liệu của một số cột bảng actor
SELECT first_name, last_name FROM actor
-- Hiển thị dữ liệu của một số cột bảng actor và đổi tên
-- Lưu ý: Tên cột phải có dấu "_" ngăn cách
SELECT first_name AS TEN_KH, last_name AS HO_KH FROM actor 
-- Hiển thị dữ liệu của một số cột bảng actor và đổi tên tiếng việt
-- Lưu ý: Tên cột bằng tiếng việt phải đặt trong dấu ""
SELECT first_name AS "Tên khách hàng", last_name AS "Họ khách hàng" FROM actor
-- Lưu ý: SQL không phân biệt chữ hoa và chữ thường, câu code không cần ở chung 1 hàng.
-- Miễn sao khi truy vấn phải bôi đen đủ câu code thì mới chạy được




-- Các dòng code đằng sau dấu “--” mang ý nghĩa comment, không chạy được code
-- Nếu phần comment quá dài, thay vì dùng "--" có thể dùng "/*" thay thế bằng cách để ở đầu và cuối của comment


-- CHANLLENGE: List tất cả thông tin KH: họ, tên, email
SELECT * FROM customer
SELECT last_name AS Ho_KH, first_name AS Ten_KH, email FROM customer




--ORDER BY: SẮP XẾP
select * from actor
order by first_name -- Sắp xếp bảng đã chọn theo cột first_name
-- Nếu không yêu cầu SQL sẽ sắp xếp theo thứ tự AZ, hoặc viết tắt là ASC, ngược lại là DESC
select * from actor
order by first_name ASC
-- Ngược lại, từ ZA là DESC
select * from actor
order by first_name DESC
-- Sắp xếp theo nhiều trường thông tin
select * from actor
order by first_name DESC, actor_id

select * from payment
order by customer_id, amount DESC, payment_date DESC




-- SELECT DISTINCT
-- Lấy tên không trùng nhau trong bảng actor
select distinct first_name from actor
order by first_name
-- Lấy tên và họ không trùng nhau trong bảng actor
select distinct first_name, last_name from actor
order by first_name




-- CHANLLENGE: Sắp xếp đơn hàng đang được trả theo giá từ cao xuống thấp
select * from payment
select distinct amount from payment
order by amount DESC




-- LIMIT
-- Top 100 hóa đơn có giá trị lớn nhất
-- Lưu ý: LIMIT luôn đứng ở cuối câu truy vấn
select * from payment
order by amount DESC
LIMIT 100




-- WHERE
-- Liệt kê hóa đơn có giá 10.99
select * from payment
where amount = 10.99
-- Liệt kê hóa đơn có giá từ 10.99 trở lên
select * from payment
where amount >= 10.99
-- Lưu ý: Dấu khác là "<>" hoặc "!="
-- Liệt kê hóa đơn có giá khác 10.99
select * from payment
where amount <> 10.99
-- Lưu ý: Các ký tự khi truy vấn khác phải để trong dấu ngoặc đơn
select * from actor
where first_name = 'NICK'
-- Liệt kê các dòng trống thông tin first_name
-- Lưu ý: khi tìm dòng null có thể viết "is null" hoặc "= null" 
-- Nhưng khi tìm với text cụ thể như câu NICK bên trên thì phải dùng dấu "="
select * from actor
where first_name is null
-- Liệt kê các dòng không trống thông tin first_name
select * from actor
where first_name is not null
-- Ngoài ra có thể dùng "where not" để truy vấn không bằng, hay khác, tương tự "is not"
select * from payment
where not amount = 10.99




-- CHALLENGE: Các khoản thanh toán không quá 2$ bao gồm mã thanh toán và số tiền
select * from payment
where amount <= 2




-- AND/OR
-- Các đơn hàng có giá trị >4$ và <9$
select * from payment
where amount > 2 and amount < 9
-- ??? Làm thế nào để kiểm tra các giá trị đã chạy đúng với code. Như excel là nhấn nút lọc để nhìn.
-- Các đơn hàng có giá trị >4$ hoặc <9$
select * from payment
where amount > 2 or amount < 9
-- Lưu ý: khi lọc theo giá trị số, dùng and nếu giá trị liền đoạn (ví dụ >2 và <9 tức là từ 3 đến 8), dùng or nếu đứt đoạn (ví dụ <2 và >9)
-- Ngoài ra các giá trị liền đoạn >= và <= có thể thay bằng câu BETWEEN




-- CHALLENGE: Các khoản thanh toán của KH 322, 346, 354 
-- Số tiền nhỏ hơn 2$ hoặc lớn hơn 10$
-- Sắp xếp theo thứ tự tăng dần theo mã khách hàng và giảm dần theo số tiền
select * from payment
where customer_id = 322 or customer_id = 346 or customer_id = 354
and amount < 2 or amount > 10
order by customer_id ASC, amount DESC
-- Lưu ý: với mệnh đề where có nhiều phần lọc như trên, nếu không () thì cụm and sẽ được thực hiện trước, rồi mới đến or
select * from payment
where (customer_id = 322 or customer_id = 346 or customer_id = 354)
and (amount < 2 or amount > 10)
order by customer_id ASC, amount DESC




-- BETWEEN
-- Các khoản thanh toán có giá trị từ >= 2 và <=9
select * from payment
where amount between 2 and 9




-- IN
-- Các hóa đơn có id 16055, 16061, 16065, 16068
select * from payment
where payment_id = 16055, or payment_id = 16061 or payment_id = 16065 or payment_id = 16068
-- Viết lại bằng IN
select * from payment
where payment_id in (16055, 16061, 16065, 16068)




-- CHALLENGE: Các khoản thanh toán của KH 12, 25, 67, 93, 124, 234
-- Với số tiền 4.99, 7.99, 9.99 trong tháng 1/2020
select * from payment
where customer_id in (12, 25, 67, 93, 124, 234)
and amount in (4.99, 7.99, 9.99)
and payment_date between '2020-01-01' and '2020-02-01'
-- ???? Nếu định dạng ngày tháng khác nhau thì lọc kiểu gì? Và có mặc định là định dạng tháng trước ngày sau hay có thể lọc theo tháng hoặc năm




-- LIKE
-- Các dòng có thông tin trong trường giống nhau ở một đặc điểm nào đó
-- VD: Tìm tên diễn viễn có chữ N đầu tên
-- Lưu ý: Dấu "%" biểu thị văn bản. "N%" biểu thị chữ J và các ký tự đằng sau
select * from actor
where first_name LIKE 'N%'
-- Tìm tên diễn viên có chữ N cuối tên
select * from actor
where first_name LIKE '%N'
-- Tìm tên diễn viên có chữ N nằm giữa
select * from actor
where first_name LIKE '%N%'
-- Tìm tên diễn viên có chữ N là chữ thứ 3, dùng dấu "_" biểu thị cho số thứ tự ký tự
select * from actor
where first_name LIKE '__N%'
-- Tìm tên diễn viên có last name bắt đầu bằng J hoặc S
select * from actor
where last_name LIKE 'J%' or last_name LIKE 'S%'
-- Tìm tên diễn viên có last name không bắt đầu bằng J hoặc S
select * from actor
where last_name not like 'J%' and last_name not like 'S%'
-- Lưu ý về mệnh đề phủ định
-- A and B > phủ định là không A and B = not A or not B
-- A or B > phủ định là không A or B = not A and not B




-- CHALLENGE: 
-- 1. Các bộ phim có chưa 'Saga' trong phần mô tả và tiêu đề bắt đầu bằng A hoặc kết thúc bằng R
select * from film
where (description like '%Saga%')
and (title like 'A%' or title like '%R')
-- 2. Các khách hàng có tên chứa ER và chữ cái thứ 2 là A
select customer_id, first_name from customer
where first_name like '%ER%'
and first_name like '_A%'



