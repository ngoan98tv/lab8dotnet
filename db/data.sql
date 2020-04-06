INSERT INTO [Student]
    ([id], [lastname], [firstname], [class_id])
VALUES
    ('B18001', 'Phạm Thị Bảo', 'Nhiên', 'K44-01'),
    ('B18002', 'Nguyễn Văn', 'An', 'K44-01'),
    ('B18003', 'Lê Hoài', 'Anh', 'K44-01'),
    ('B18004', 'Nguyễn Lâm Hoàng', 'Anh', 'K44-01'),
    ('B18005', 'Lê Minh', 'Bằng', 'K44-01'),
    ('B18006', 'Vương Thừa', 'Chấn', 'K44-02'),
    ('B18007', 'Cao Công', 'Danh', 'K44-02'),
    ('B18008', 'Trịnh Lê Long', 'Đức', 'K44-02'),
    ('B18009', 'Dương Lê Minh', 'Hậu', 'K44-02'),
    ('B18010', 'Nguyễn Vũ', 'Hoàng', 'K44-02'),
    ('B18011', 'Nguyễn Hoàng Thái', 'Học', 'K44-03'),
    ('B18012', 'Nguyễn Quốc', 'Huy', 'K44-03'),
    ('B18013', 'Võ Đoàn Gia', 'Huy', 'K44-03'),
    ('B18014', 'Vũ Thị Bích', 'Huyền', 'K44-03'),
    ('B18015', 'Hồ Việt', 'Hưng', 'K44-03')
GO

INSERT INTO [Class]
    ([id], [name])
VALUES
    ('K44-01', 'CNPM 01'),
    ('K44-02', 'CNPM 02'),
    ('K44-03', 'CNPM 03')
GO

INSERT INTO [Subject]
    ([id], [name])
VALUES
    ('CT101', 'Lập trình căn bản'),
    ('CT103', 'Cấu trúc dữ liệu'),
    ('CT251', 'Phát triển ứng dụng trên Windows')
GO

INSERT INTO [Teacher]
    ([id], [name], [password])
VALUES
    ('001', 'Nguyễn Văn Cường', '123'),
    ('002', 'Huỳnh Minh Phương', '123'),
    ('003', 'Thái Cẩm Nhung', '123')
GO

INSERT INTO [Course]
    ([teacher_id], [subject_id], [class_id])
VALUES
    ('001', 'CT101', 'K44-01'),
    ('001', 'CT101', 'K44-02'),
    ('001', 'CT103', 'K44-01'),
    ('001', 'CT103', 'K44-03'),
    ('002', 'CT101', 'K44-03'),
    ('002', 'CT103', 'K44-02'),
    ('003', 'CT251', 'K44-01'),
    ('003', 'CT251', 'K44-02'),
    ('003', 'CT251', 'K44-03')
GO
