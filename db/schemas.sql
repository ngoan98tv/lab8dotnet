CREATE TABLE [Subject] (
  [id] integer PRIMARY KEY,
  [name] nvarchar(255)
)
GO

CREATE TABLE [Teacher] (
  [id] integer PRIMARY KEY,
  [name] nvarchar(255),
  [password] nvarchar(255)
)
GO

CREATE TABLE [Class] (
  [id] integer PRIMARY KEY,
  [name] nvarchar(255)
)
GO

CREATE TABLE [Student] (
  [id] integer PRIMARY KEY,
  [firstname] nvarchar(255),
  [lastname] nvarchar(255),
  [class_id] int
)
GO

CREATE TABLE [Course] (
  [id] integer PRIMARY KEY,
  [teacher_id] integer,
  [class_id] integer,
  [subject_id] integer,
  UNIQUE ([subject_id], [teacher_id], [class_id])
)
GO

CREATE TABLE [Point] (
  [id] integer PRIMARY KEY,
  [student_id] integer,
  [course_id] integer,
  [value] float
)
GO

ALTER TABLE [Student] ADD FOREIGN KEY ([class_id]) REFERENCES [Class] ([id])
GO

ALTER TABLE [Course] ADD FOREIGN KEY ([teacher_id]) REFERENCES [Teacher] ([id])
GO

ALTER TABLE [Course] ADD FOREIGN KEY ([class_id]) REFERENCES [Class] ([id])
GO

ALTER TABLE [Course] ADD FOREIGN KEY ([subject_id]) REFERENCES [Subject] ([id])
GO

ALTER TABLE [Point] ADD FOREIGN KEY ([student_id]) REFERENCES [Student] ([id])
GO

ALTER TABLE [Point] ADD FOREIGN KEY ([course_id]) REFERENCES [Course] ([id])
GO

