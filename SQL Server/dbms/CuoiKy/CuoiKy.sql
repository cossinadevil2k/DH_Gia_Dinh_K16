﻿-- 221402

use master;
ALTER DATABASE db_Starbucks_Coffee SET OFFLINE WITH ROLLBACK IMMEDIATE;
ALTER DATABASE db_Starbucks_Coffee SET ONLINE;

DROP DATABASE db_Starbucks_Coffee;

-- 1.
/*
	Cài đặt CSDL quản lý chuỗi cửa hàng Starbucks Coffee có tên là db_Starbucks_Coffee. 
Lưu ý, trước khi tạo CSDL nên kiểm tra CSDL đã tồn tại chưa, nếu đã tồn tại rồi thì không 
cho phép tạo mới CSDL. 
*/

CREATE DATABASE db_Starbucks_Coffee;
GO
use db_Starbucks_Coffee;
GO

-- 2.
/*
	Tạo các bảng dữ liệu và thiết lập tên cột, kiểu dữ liệu theo mô tả ở Phần IV. Bổ sung 
tất cả các ràng buộc cần thiết (nếu có). 
*/

create table nhanvien (
	manv char(5) primary key,
	tennv nvarchar(100),
	macv char(3),
	macn char(3),
	ngaysinh datetime,
	gioitinh bit,
	sodt char(10),
	email nvarchar(50),
	diachi nvarchar(100),
	ngayvao datetime,
	ngaynghi datetime
)

create table chucvu (
	macv char(3) primary key,
	tencv nvarchar(100)
)

create table loaithucuong (
	maloai char(5) primary key,
	tenloai nvarchar(100)
)

create table thucuong (
	matu char(5) primary key,
	maloai char(5),
	tentu nvarchar(100),
	dongia decimal
)

create table khuvuc (
	makv char(3) primary key,
	tenkv nvarchar(10),
	hesogia float
)

create table congthuc (
	matu char(5),
	manl char(10),
	soluong float
)

create table chinhanh (
	macn char(3) primary key,
	tencn nvarchar(100),
	sodt char(10),
	diachi nvarchar(100),
	hesogia float
)

create table baocao (
	mabc char(10) primary key,
	manv char(5),
	tenbc nvarchar(100),
	ngaylap datetime,
	noidung nvarchar(max)
)

create table nhacungcap (
	mancc char(5) primary key,
	tenncc nvarchar(10),
	sodt char(10),
	email nvarchar(50),
	diachi nvarchar(100)
)

create table phieuphuthu (
	maphieupt char(10) primary key,
	manv char(5),
	tenppt nvarchar(100),
	ngaylap datetime,
	sotien decimal
)

create table phieuchi (
	mapc char(10) primary key,
	manv char(5),
	noidungchi nvarchar(max),
	ngaylap datetime,
	tongtien decimal
)

create table phieunhap (
	mapn char(10) primary key,
	manv char(5),
	mancc char(5),
	ngaylap datetime,
	tongtien decimal
)

create table hoadon (
	mahd nvarchar(20) primary key,
	manv char(5),
	makv char(3),
	ngaylap datetime,
	tongtien decimal
)

create table chitiet_hoadon (
	matu char(5),
	mahd nvarchar(20),
	soluong float
)

create table chitiet_phieunhap (
	manl char(10),
	mapn char(10),
	soluong float
)

create table nguyenlieu (
	manl char(10) primary key,
	tennl nvarchar(100),
	soluong float,
	donvi nvarchar(25)
)

alter table nhanvien add constraint fk_nhanvien_macv foreign key (macv) references chucvu(macv)
alter table nhanvien add constraint fk_nhanvien_macn foreign key (macn) references chinhanh(macn)
alter table thucuong add constraint fk_thucuong_maloai foreign key (maloai) references loaithucuong(maloai)
alter table congthuc add constraint fk_congthuc_matu foreign key (matu) references thucuong(matu)
alter table congthuc add constraint fk_congthuc_manl foreign key (manl) references nguyenlieu(manl)
alter table baocao add constraint fk_baocao_manv foreign key (manv) references nhanvien(manv)
alter table phieuphuthu add constraint fk_phiephuthu_manv foreign key (manv) references nhanvien(manv)
alter table phieuchi add constraint fk_phieuchi_manv foreign key (manv) references nhanvien(manv)
alter table phieunhap add constraint fk_phieunhap_manv foreign key (manv) references nhanvien(manv)
alter table phieunhap add constraint fk_phieunhap_mancc foreign key (mancc) references nhacungcap(mancc)
alter table hoadon add constraint fk_hoadon_manv foreign key (manv) references nhanvien(manv)
alter table hoadon add constraint fk_hoadon_makv foreign key (makv) references khuvuc(makv)
alter table chitiet_hoadon add constraint fk_chitiet_hoadon_matu foreign key (matu) references thucuong(matu)
alter table chitiet_hoadon add constraint fk_chitiet_hoadon_mahd foreign key (mahd) references hoadon(mahd)
alter table chitiet_phieunhap add constraint fk_chitiet_phieunhap_manl foreign key (manl) references nguyenlieu(manl)
alter table chitiet_phieunhap add constraint fk_chitiet_phieunhap_mapn foreign key (mapn) references phieunhap(mapn)

-- 3.
/*
	Thêm dữ liệu vào CSDL db_Starbucks_Coffee. Mỗi bảng tối thiểu 10-50 dòng dữ 
liệu (sinh viên tùy chỉnh dữ liệu sau cho mỗi yêu cầu truy vấn bên dưới đều trả về ít 
nhất một dòng giá trị, yêu cầu đọc dữ liệu từ file .csv).
*/

begin
	alter table nhanvien nocheck constraint all
	bulk insert nhanvien
	from 'nhanvien.csv'
	with (
		format = 'CSV',
		firstrow = 2,
		rowterminator = '0x0a'
	);
	alter table nhanvien check constraint all
end

begin
	alter table chucvu nocheck constraint all
	bulk insert chucvu
	from 'chucvu.csv'
	with (
		format = 'CSV',
		firstrow = 2,
		rowterminator = '0x0a'
	);
	alter table chucvu check constraint all
end

begin
	alter table loaithucuong nocheck constraint all
	bulk insert loaithucuong
	from 'loaithucuong.csv'
	with (
		format = 'CSV',
		firstrow = 2,
		rowterminator = '0x0a'
	);
	alter table loaithucuong check constraint all
end

begin
	alter table thucuong nocheck constraint all
	bulk insert thucuong
	from 'thucuong.csv'
	with (
		format = 'CSV',
		firstrow = 2,
		rowterminator = '0x0a'
	);
	alter table thucuong check constraint all
end

begin
	alter table khuvuc nocheck constraint all
	bulk insert khuvuc
	from 'khuvuc.csv'
	with (
		format = 'CSV',
		firstrow = 2,
		rowterminator = '0x0a'
	);
	alter table khuvuc check constraint all
end

begin
	alter table congthuc nocheck constraint all
	bulk insert congthuc
	from 'congthuc.csv'
	with (
		format = 'CSV',
		firstrow = 2,
		rowterminator = '0x0a'
	);
	alter table congthuc check constraint all
end

begin
	alter table chinhanh nocheck constraint all
	bulk insert chinhanh
	from 'chinhanh.csv'
	with (
		format = 'CSV',
		firstrow = 2,
		rowterminator = '0x0a'
	);
	alter table chinhanh check constraint all
end

begin
	alter table baocao nocheck constraint all
	bulk insert baocao
	from 'baocao.csv'
	with (
		format = 'CSV',
		firstrow = 2,
		rowterminator = '0x0a'
	);
	alter table baocao check constraint all
end
	
begin
	alter table nhacungcap nocheck constraint all
	bulk insert nhacungcap
	from 'nhacungcap.csv'
	with (
		format = 'CSV',
		firstrow = 2,
		rowterminator = '0x0a'
	);
	alter table nhacungcap check constraint all
end

begin
	alter table phieuphuthu nocheck constraint all
	bulk insert phieuphuthu
	from 'phieuphuthu.csv'
	with (
		format = 'CSV',
		firstrow = 2,
		rowterminator = '0x0a'
	);
	alter table phieuphuthu check constraint all
end

begin
	alter table phieuchi nocheck constraint all
	bulk insert phieuchi
	from 'phieuchi.csv'
	with (
		format = 'CSV',
		firstrow = 2,
		rowterminator = '0x0a'
	);
	alter table phieuchi check constraint all
end

begin
	alter table phieunhap nocheck constraint all
	bulk insert phieunhap
	from 'phieuchi.csv'
	with (
		format = 'CSV',
		firstrow = 2,
		rowterminator = '0x0a'
	);
	alter table phieunhap check constraint all
end

begin
	alter table hoadon nocheck constraint all
	bulk insert hoadon
	from 'phieuchi.csv'
	with (
		format = 'CSV',
		firstrow = 2,
		rowterminator = '0x0a'
	);
	alter table hoadon check constraint all
end

begin
	alter table chitiet_hoadon nocheck constraint all
	bulk insert chitiet_hoadon
	from 'chitiet_hoadon.csv'
	with (
		format = 'CSV',
		firstrow = 2,
		rowterminator = '0x0a'
	);
	alter table chitiet_hoadon check constraint all
end

begin
	alter table chitiet_phieunhap nocheck constraint all
	bulk insert chitiet_phieunhap
	from 'chitiet_phieunhap.csv'
	with (
		format = 'CSV',
		firstrow = 2,
		rowterminator = '0x0a'
	);
	alter table chitiet_phieunhap check constraint all
end

begin
	alter table nguyenlieu nocheck constraint all
	bulk insert nguyenlieu
	from 'nguyenlieu.csv'
	with (
		format = 'CSV',
		firstrow = 2,
		rowterminator = '0x0a'
	);
	alter table nguyenlieu check constraint all
end


-- 4.
/*
	Viết câu lệnh thêm bảng vào HOADON có mã hóa đơn là HD101, mã nhân viên 
NV1, mã khu vực KV1, ngày lập 12/2/2024, tổng tiền là 83000. 
*/

insert into hoadon
	(mahd, manv, makv, ngaylap, tongtien)
values
	('HD01', 'NV1', 'KV1', '02/12/2024', 83000)

-- 5.
/*
	Viết câu lệnh thêm vào bảng CHITIET_HOADON các giá trị: mã hóa đơn là HD101, 
mã thức uống là TU10, số lượng là 1. 
*/

insert into chitiet_hoadon
	(matu, mahd, soluong)
values
	('TU10', 'HD101', 1)

-- 6.
/*
	Viết câu lệnh thêm vào bảng PHIEUCHI có mã phiếu chi là PC51, mã nhân viên là 
NV5, nội dung chi là ‘rút doanh thu ngày’, ngày lập: 11/2/2024 và tổng tiền: 
15000000. 
*/

insert into phieuchi
	(mapc, manv, noidungchi, ngaylap, tongtien)
values
	('PC51', 'NV5', N'rút doanh thu ngày', '02/11/2024', 15000000)

-- 7.
/*
	Viết câu lệnh thêm vào bảng PHIEUNHAP có mã phiếu nhập là PN55, mã nhân 
viên là NV3, mã nhà cung cấp là NCC1, ngày lập 12/1/2024 và tổng tiền là 1200000. 
*/

insert into phieunhap
	(mapn, manv, mancc, ngaylap, tongtien)
values
	('PN55', 'NV3', 'NCC1', '01/12/2024', 1200000)

-- 8.
/*
	Viết câu lệnh thêm vào PHIEUPHUTHU có mã phiếu phụ thu PTT63, mã nhân viên 
là NV2, tên phiếu phụ thu là ‘Khách làm vỡ ly’, ngày lập 11/20/2024, số tiền phụ 
thu là 30000.  
*/

insert into phieuphuthu
	(maphieupt, manv, tenppt, ngaylap, sotien)
values
	('PTT63', 'NV2', N'Khách làm vỡ ly', '20/11/2024', 30000)

-- 9.
/*
	Viết câu lệnh sửa tất cả mã nhân viên trong bảng PHIEUPHUTHU thành 'NV2' trong 
duy nhất ngày 14/02/2024.
*/

update phieuphuthu
set manv = 'NV2'
where ngaylap = '02/14/2024'

-- 10.
/*
	Viết câu lệnh sửa TENPPT của nhân viên có mã NV3 trong ngày 30/01/2024 thành 
'Quay phim'. 
*/

update phieuphuthu
set tenppt = N'Quay phim'
where manv = 'NV3' and ngaylap = '01/30/2024'

-- 11.
/*
	 Tăng hệ số giá thêm 1 cho khu vực có nhiều người uống nhất.
*/

update khuvuc
set hesogia = hesogia + 1
where makv in (
	select top 1 makv
	from hoadon
	left join chitiet_hoadon on chitiet_hoadon.mahd = hoadon.mahd
	group by makv
	order by sum(soluong) desc
)

-- 12.
/*
	 Giảm 20% giá các thức uống không bán được trong tháng 1/2024.
*/

-- 13.
/*
	Tăng thêm 50% giá các thức uống bán chạy nhất. 
*/

-- 14.
/*
	Viết câu lệnh xóa báo cáo của một nhân viên với MANV=NV5 vào  ngày 31/01/2024.
*/

delete from baocao
where manv = 'NV5' and ngaylap = '01/31/2024'

-- 15.
/*
	 Viết câu lệnh xóa phiếu phụ thu của nhân viên có mã là NV3 đã lập vào ngày 
21/09/2023.
*/

delete from phieuphuthu
where manv = 'NV3' and ngaylap = '09/21/2023'

-- 16.
/*
	Xuất ra danh sách các thức uống có loại là Tea (mã: tea) 
*/

select *
from thucuong
where maloai = 'tea'

-- 17.
/*
	 Xuất ra danh sách thức uống không chứa nguyên liệu sữa đặc. 
*/

select * -- !!!!!!!!!!!!!!!
from thucuong
join congthuc on congthuc.matu = thucuong.matu
join nguyenlieu on nguyenlieu.manl = congthuc.manl

-- 18.
/*
	Xuất ra danh sách những loại thức uống có giá thấp hơn 50 ngàn.
*/

select *
from thucuong
where dongia < 50000

-- 19.
/*
	 Hãy lọc ra những nguyên liệu được cung cấp bởi nhà cung cấp NCC1. 
*/

select *
from nguyenlieu
join chitiet_phieunhap on chitiet_phieunhap.manl = nguyenlieu.manl
join phieunhap on phieunhap.mapn = chitiet_phieunhap.mapn
where mancc = 'NCC1'

-- 20.
/*
	 Viết câu lệnh thống kê toàn bộ những nhà cung cấp đang cấp hàng cho hệ thống.
*/

select nhacungcap.mancc, tenncc
from nguyenlieu
join chitiet_phieunhap on chitiet_phieunhap.manl = nguyenlieu.manl
join phieunhap on phieunhap.mapn = chitiet_phieunhap.mapn
join nhacungcap on nhacungcap.mancc = phieunhap.mancc

-- 21.
/*
	 Hãy liệt kê danh sách nhân viên theo chi nhánh 1, 2, 3.
*/

select *
from nhanvien
order by macn

-- 22.
/*
	 Viết câu lệnh để liệt kê thức uống bán nhiều nhất. 
*/

-- 23.
/*
	Viết câu lệnh tìm khu vực khách hàng chọn nhiều nhất. 
*/

-- 24.
/*
	 Viết câu lệnh thống kê tổng chi theo từng quý.
*/

-- 25.
/*
	 Viết câu lệnh để thống kê tổng phụ thu. 
*/

-- 26.
/*
	 Viết câu lệnh để tính doanh thu toàn hệ thống năm 2023.
*/

-- 27.
/*
	Viết câu lệnh để tính doanh thu toàn hệ thống của quý 1 năm 2024. 
*/

-- 28.
/*
	 Tính lợi nhuận toàn hệ thống năm 2023.
*/

-- 29.
/*
	Tính lợi nhuận theo từng chi nhánh. 
*/

-- 30.
/*
	 Thống kê số lượng tồn của tất cả các nguyên liệu còn dưới mức quy định.
*/

-- 31.
/*
	Liệt kê loại nguyên liệu được sử dụng nhiều nhất. 
*/

-- 32.
/*
	 Hãy viết thủ tục thêm một nhân viên mới vào bảng NHANVIEN với tham số truyền 
vào là mã nhân viên, tên nhân viên, mã chức chức vụ, mã chi nhánh, giới tính, ngày 
vào, ngày nghĩ (có thể null). Kiểm tra ngày vào phải lớn hơn ngày thành lập hệ thống 
(01/01/2020) và ràng buộc tồn tại các mã chức vụ, mã chi nhánh.
*/

-- 33.
/*
	Viết thủ tục thêm một thức uống vào bảng THUCUONG với tham số truyền vào là 
mã thức uống, mã loại thức uống, tên thức uống, đơn giá. Kiểm tra tham số vào 
(kiểm tra tồn tại mã loại thức uống). 
*/

-- 34.
/*
	Viết thủ tục thêm mới một loại thức uống mới vào bảng LOAITHUCUONG với 
tham số truyền vào là mã loại, tên loại thức uống.
*/

-- 35.
/*
	Viết thủ tục thêm mới một nguyên vào bảng NGUYENLIEU với tham số đầu vào 
là mã nguyên liệu, tên nguyên liệu, số lượng, đơn vị.  
*/

-- 36.
/*
	 Viết thủ tục để cập nhật thông tin của một thức uống trong bảng THUCUONG với 
tham số đầu vào là mã thức uống, mã loại thức uống, tên thức uống, đơn giá. Kiểm 
tra ràng buộc tồn tại thức uống và mã loại thức uống.
*/

-- 37.
/*
	Viết thủ tục liệt kê các thức uống thuộc một loại thức uống bất kì, với tham số truyền 
vào là tên loại. Kiểm tra ràng buộc tồn tại tên loại.   
*/

-- 38.
/*
	 Viết thủ tục liệt kê thông tin tất cả các nguyên liệu (tên nguyên liệu, số lượng tồn 
kho, đơn vị) của một thức uống bất kì, với tham số truyền vào là tên thức uống. Kiểm 
tra ràng buộc tồn tại tên thức uống. 
*/

-- 39.
/*
	Viết thủ tục dùng để tìm những thức uống không bán được của chi nhánh bất kì trong 
khoảng thời gian nào đó. Với tham số đầu vào là tên chi nhánh, thời gian bắt đầu và 
thời gian kết thúc.   
*/

-- 40.
/*
	Viết thủ tục liệt kê tên các nguyên liệu của một nhà cung cấp bất kì, với tham số đầu 
vào là tên nhà cung cấp, kiểm tra ràng buộc tồn tại tên nhà cung cấp.  
*/

-- 41.
/*
	 Viết thủ tục tăng giá của một thức uống bất kì với tham số truyền vào là tên thức 
uống và hệ số giá. Điều kiện tên thức uống tồn tại và hệ số tăng giá phải nhỏ hơn 1 
đồng thời không nhỏ hơn -0.5. 
*/

-- 42.
/*
	Viết thủ tục tính tổng tiền phụ thu của một chi nhánh bất kì trong thời gian bất kì. 
Với tham số truyền vào là tên chi nhánh, thời gian bắt đầu và thời gian kết thúc. Điều 
kiện ràng buộc thời gian bắt đầu phải trước thời gian kết thúc.     
*/

-- 43.
/*
	Viết thủ tục tính lợi nhuận của hệ thống trong khoảng thời gian bất kì. Với tham số 
đầu vào là thời gian bắt đầu, thời gian kết thúc. Tham sô đầu ra là tổng lợi nhuận của 
hệ thống (lợi nhuận = tổng doanh thu - tổng chi). 
*/

-- 44.
/*
	 Viết thủ tục tìm thức uống bán chạy nhất của chi nhánh bất kì trong khoảng thời gian 
bất kì, với tham số truyền vào là tên chi nhánh, thời gian bắt đầu và thời gian kết 
thúc. Điều kiện thời gian bắt đầu trước thời gian kết thúc.   
*/

-- 45.
/*
	 Viết thủ tục tính tổng số tiền doanh thu của hệ thống trong một ngày bất kì với tham 
số đầu vào là ngày và tham số đầu ra là tổng doanh thu của ngày đó. 
*/

-- 46.
/*
	 Viết thủ tục tìm thức uống bán chạy nhất của hệ thống trong khoảng thời gian bất kì, 
với tham số truyền vào là thời gian bắt đầu và thời gian kết thúc. Điều kiện thời gian 
bắt đầu trước thời gian kết thúc.  
*/

-- 47.
/*
	 Viết thủ tục liệt kê các loại nguyên liệu (tên, số lượng tồn, đơn vị) của một phiếu 
nhập bất kì, với tham số đầu vào là mã phiếu nhập. 
*/

-- 48.
/*
	Viết thủ tục tính tổng doanh thu của hệ thống trong khoảng thời gian bất kì. Với 
tham số đầu vào là thời gian bắt đầu, thời gian kết thúc. Tham sô đầu ra là tổng 
doanh thu của hệ thống (doanh thu= tổng tiền hóa đơn + tổng tiền phụ thu).  
*/

-- 49.
/*
	Viết thủ tục tính tổng chi tiêu của hệ thống trong khoảng thời gian bất kì. Với tham 
số đầu vào là thời gian bắt đầu, thời gian kết thúc. Tham sô đầu ra là tổng tiền chi 
của hệ thống (tổng chi= tổng tiền phiếu nhập + tổng tiền phiếu chi).
*/

-- 50.
/*
	 Viết một thủ tục với tùy chọn ‘with encryption’, mã hóa không cho người dùng xem 
được nội dung của thủ tục.  
*/

-- 51.
/*
	 Viết Trigger bắt lỗi cho lệnh Insert vào bảng CHITIET_HOADON. Khi thêm chi 
tiết hóa đơn thì kiểm tra trùng mã, kiểm tra nhập số lượng âm, thông báo không đủ 
nguyên liệu nếu hết và phải giảm số lượng tồn của nguyên liệu nếu thỏa các điều 
kiện còn lại.
*/

-- 52.
/*
	 Viết Trigger bắt lỗi cho lệnh Update vào bảng CHITIET_HOADON. Khi sửa số 
lượng thức uống trong chi tiết hóa đơn thì phải sửa số lượng tồn của nguyên liệu. 
*/

-- 53.
/*
	 Viết Trigger bắt lỗi cho lệnh Delete vào bảng CHITIET_HOADON. Khi xóa chi tiết 
hóa đơn thì phải tăng số lượng tồn của nguyên liệu kiểm tra nếu xóa hết mã hóa đơn 
đó thì xóa lun bên bảng hóa đơn. 
*/

-- 54.
/*
	 Viết Trigger bắt lỗi cho lệnh Insert vào bảng CHITIET_PHIEUNHAP. Khi thêm chi 
tiết nhập thì kiểm tra trùng mã, bắt không được nhập số âm phải tăng số lượng tồn 
của nguyên liệu (nhập hàng). 
*/

-- 55.
/*
	Viết Trigger bắt lỗi cho lệnh Update vào bảng CHITIET_PHIEUNHAP. Khi sửa số 
lượng nguyên liệu trong chi tiết phiếu nhập thì: không được sửa số âm, phải sửa số 
lượng tồn của nguyên liệu. 
*/

-- 56.
/*
	Viết Trigger bắt lỗi cho lệnh Delete vào bảng CHITIET_PHIEUNHAP. Khi xóa chi 
tiết nhập thì phải giảm số lượng tồn của nguyên liệu, kiểm tra chi tiết phiếu nhập của 
Mã phiếu nhập vừa xóa còn trong bảng chi tiết phiếu nhập hay không, nếu không thì 
xóa phiếu nhập đó bên bảng PHIEUNHAP. 
*/

-- 57.
/*
	 Viết Trigger cho lệnh Delete của bảng NHANVIEN. Khi xóa nhân viên thì tự động 
xóa các bảng có liên quan ( chỉ xóa nhân viên đã nghĩ hơn 12 tháng). 
*/

-- 58.
/*
	 Viết Trigger bắt lỗi tuổi nhân viên khi Insert và khi Update bảng NHANVIEN. Điều 
kiện nhân viên phải trên 18 tuổi. 
*/

-- 59.
/*
	Viết Trigger bắt lỗi dữ liệu không âm cho các trường số lượng , tổng tiền,.. (kiểu số) 
có các bảng dữ liệu.
*/

-- 60.
/*
	Hệ thống có 4 nhóm quyền: BANHANG, KIEMKHO, QUANLY, GIAMDOC. Hãy 
phân quyền cho từng nhóm này theo mô tả ở Phần II.
*/

