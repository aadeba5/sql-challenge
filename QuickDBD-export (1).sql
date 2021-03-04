-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Departments] (
    [dept_no] varchar  NOT NULL ,
    [dept_name] varchar  NOT NULL ,
    CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED (
        [dept_no] ASC
    )
)

CREATE TABLE [dept_employees] (
    [dept_no] varchar  NOT NULL ,
    [emp_no] int  NOT NULL 
)

CREATE TABLE [dept_manager] (
    [dept_no] varchar  NOT NULL ,
    [emp_no] int  NOT NULL 
)

CREATE TABLE [employees] (
    [dept_no] varchar  NOT NULL ,
    [emp_no] int  NOT NULL ,
    [emp_title_id] varchar  NOT NULL ,
    [birth_date] date  NOT NULL ,
    [first_name] varchar  NOT NULL ,
    [last_name] varchar  NOT NULL ,
    [sex] varchar  NOT NULL ,
    [hire_date] date  NOT NULL ,
    CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [slaries] (
    [emp_no] int  NOT NULL ,
    [salary] int  NOT NULL 
)

CREATE TABLE [titles] (
    [title_id] varchar  NOT NULL ,
    [title] varchar  NOT NULL ,
    CONSTRAINT [PK_titles] PRIMARY KEY CLUSTERED (
        [title_id] ASC
    )
)

ALTER TABLE [dept_employees] WITH CHECK ADD CONSTRAINT [FK_dept_employees_dept_no] FOREIGN KEY([dept_no])
REFERENCES [Departments] ([dept_no])

ALTER TABLE [dept_employees] CHECK CONSTRAINT [FK_dept_employees_dept_no]

ALTER TABLE [dept_employees] WITH CHECK ADD CONSTRAINT [FK_dept_employees_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [dept_employees] CHECK CONSTRAINT [FK_dept_employees_emp_no]

ALTER TABLE [dept_manager] WITH CHECK ADD CONSTRAINT [FK_dept_manager_dept_no] FOREIGN KEY([dept_no])
REFERENCES [Departments] ([dept_no])

ALTER TABLE [dept_manager] CHECK CONSTRAINT [FK_dept_manager_dept_no]

ALTER TABLE [dept_manager] WITH CHECK ADD CONSTRAINT [FK_dept_manager_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [dept_manager] CHECK CONSTRAINT [FK_dept_manager_emp_no]

ALTER TABLE [employees] WITH CHECK ADD CONSTRAINT [FK_employees_dept_no] FOREIGN KEY([dept_no])
REFERENCES [Departments] ([dept_no])

ALTER TABLE [employees] CHECK CONSTRAINT [FK_employees_dept_no]

ALTER TABLE [employees] WITH CHECK ADD CONSTRAINT [FK_employees_emp_title_id] FOREIGN KEY([emp_title_id])
REFERENCES [titles] ([title_id])

ALTER TABLE [employees] CHECK CONSTRAINT [FK_employees_emp_title_id]

ALTER TABLE [slaries] WITH CHECK ADD CONSTRAINT [FK_slaries_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [slaries] CHECK CONSTRAINT [FK_slaries_emp_no]

COMMIT TRANSACTION QUICKDBD