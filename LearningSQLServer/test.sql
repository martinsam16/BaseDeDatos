USE learning;
-- Create a new table called '[PERSONA]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[PERSONA]', 'U') IS NOT NULL
DROP TABLE [dbo].[PERSONA]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[PERSONA]
(
    [CODPER] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [NOMPER] VARCHAR(50) NOT NULL,
    [APEPER] VARCHAR(50) NOT NULL,
    [DOCPER] VARCHAR(11)
    -- Specify more columns here
);
GO