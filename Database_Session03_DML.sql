use Demo;
select * from Categories;
select * from Product;
-- 1. Thêm 1 bản ghi đầy đủ thông tin vào bảng Product
insert into Product
values('P0005','Sản phẩm 5',100,'Mô tả sản phẩm 5',1,1);
insert into Product
values('P0006','Sản phẩm 6',200,'Mô tả sản phẩm 6',1,1);
-- 2. Thêm 1 bản ghi gồm mã sản phẩm, tên sản phẩm, giá sản phẩm, danh mục sản phẩm vào bảng product
insert into Product(product_id,product_name,cat_id,product_price)
values('P0007','Sản phẩm 7',1,50);
-- 3.  Thêm 3 sản phẩm vào bảng product
insert into Product
values('P0008','Sản phẩm 8',50,'Mô tả sản phẩm 8',1,1),
		('P0009','Sản phẩm 9',50,'Mô tả sản phẩm 9',2,1),
        ('P0010','Sản phẩm 10',50,'Mô tả sản phẩm 10',4,1);
-- 4. Cập nhật tất cacr các trạng thái sản phẩm thành 1
update product
set product_status = 1;
-- 5. Cập nhật sản phẩm thành tên sản phẩm test, giá là 100 với những sản phẩm có mã là P0001
update product
set product_name = 'Sản phẩm test',
	product_price = 100
where product_id = 'P0001';
-- 6. Xóa sản phẩm có tên là sản phẩm 10
delete from product where product_name = 'sẢn Phẩm 10';
-- 7. Chỉ dùng mệnh đề select để truy vấn dữ liệu
select current_date();
-- 8. Lấy tất cả dữ liệu của bảng product
select * from Product; -- Không tối ưu trong câu truy vấn
select p.product_id, p.product_name, p.product_price, p.product_descriptions, p.cat_id, p.product_status
from product p;
-- 9. Lấy thông tin sản phẩm gồm mã sản phẩm, tên sản phẩm, giá sản phẩm
select p.product_id, p.product_name, p.product_price
from Product as p;
-- 10. Lấy ra giá lớn nhất, nhỏ nhất, tổng giá, trung bình giá của các sản phẩm trong product
select max(p.product_price) as 'Giá lớn nhất',min(p.product_price) as 'Giá nhỏ nhất',sum(p.product_price),avg(p.product_price)
from product p;
-- 11. Lấy ra dữ liệu gồm 'Mã sản phẩm - tên sản phẩm',giá sản phẩm cộng với 10
select concat(p.product_id,p.product_name),p.product_price+10
from product p;
-- 12. Thống kê các mã danh mục có trong bảng product
select distinct p.cat_id
from product p;
select * from product;
-- 13. Lấy thông tin sản phẩm gồm: mã sản phẩm, tên sản phẩm, giá, mã danh mục, tên danh mục
select p.product_id, p.product_name, p.product_price, p.cat_id, c.cat_name
from product p inner join categories c on p.cat_id = c.cat_id;
-- 14. Lấy thông tin: mã danh mục, mã sản phẩm, giá, số lượng, mã hóa đơn, tên người dùng
select c.cat_id, p.product_id, p.product_price, od.quantity, o.order_id, u.user_name
from Categories c join Product p on  c.cat_id = p.cat_id
				join Order_Detail od on p.product_id = od.product_id
                join App_order o on od.order_id = o.order_id
                join App_user u on o.user_id = u.user_id;
-- 15. Lấy tất cả thông tin sản phẩm gồm cả thông tin danh mục
select *
from product p right join categories c on p.cat_id = c.cat_id ;
-- 16. Lấy tất cả các sản phẩm có giá lớn hơn hoặc bằng 100
select *
from product p
where p.product_price>=100;
-- 17. Lấy tất cả các sản phẩm có giá trong khoảng từ 50 đên 150
select *
from product p
where p.product_price>=50 and p.product_price<=150;
select *
from product p
where p.product_price between 50 and 150;
-- 18. Lấy các sản phẩm có giá hoặc là 50 hoặc 100 hoặc 200
select *
from product p
where p.product_price in (50,100,200);
-- 19. Lấy thông tin sản phẩm có tên sản phẩm là sản phẩm 9
select *
from product p
where p.product_name like 'Sản phẩm 9';
-- 20. Lấy thông tin các sản phẩm bắt đầu là Sản
select *
from product p
where p.product_name like 'Sản%';
-- 21. Lấy thông tin sản phẩm có ký tự thứ 3 là n
select *
from product p
where p.product_name like '__n%';
-- 22. Tính trung bình giá của các sản phẩm theo danh mục
select p.cat_id, p.product_status, avg(p.product_price)
from product p join categories c on p.cat_id = c.cat_id
group by p.cat_id, p.product_status;
-- 23. Lấy ra thông tin các nhóm theo mã danh mục có giá trung bình lơn hơn hoặc bằng 80
select p.cat_id,avg(p.product_price)
from product p
group by p.cat_id
having avg(p.product_price)>=80;
-- 24. Sắp xếp các sản phẩm theo giá tăng dần
select *
from product p
order by p.product_price;
-- 25. Sắp xếp các sản phẩm theo giá tăng dần, các sản phẩm có giá bằng nhau thì sắp xêp theo tên giảm dần
select *
from product p
order by p.product_price ASC, p.product_name DESC;
-- 26. Lấy 5 sản phẩm đầu tiên trong bảng product
select *
from product p
limit 5;
-- 27. Lấy 3 sản phẩm từ vị trí thứ 2
select *
from product p
limit 3 offset 2;

