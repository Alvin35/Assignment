USE [Test]
GO
/****** Object:  StoredProcedure [dbo].[ORWork]    Script Date: 9/13/2019 10:50:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






ALTER PROCEDURE [dbo].[ORWork]

@PageIndex int,
@PageSize int,
@OrderBy nvarchar(50),
@searchText nvarchar(200)
AS
DECLARE @sql nvarchar(max),
		@paramlist nvarchar(4000),
		@nl char(2)=char(13)+char(10)
BEGIN
	
	SET NOCOUNT ON;

    SELECT @sql=
		'SELECT * from Product p where [Name]=CONVERT(nvarchar(250),@searchText) OR
									   Description=CONVERT(nvarchar(250),@searchText) OR
									   ImageUrl=CONVERT(nvarchar(250),@searchText) OR
									   Category=CONVERT(nvarchar(50),@searchText) OR '

		SELECT @sql +='ORDER BY '+Convert(nvarchar(50),@OrderBy)+@nl

		SELECT @sql+='OFFSET ('+@PageIndex+'-1) *'+@PageSize+' ROWS
	    FETCH_NEXT'+ @PageSize+' ROWS only;'

		SELECT @paramlist='@PageIndex int,@PageSize int,@OrderBy nvarchar(50),@searchText nvarchar(50)'
	
	    EXEC sp_executesql @sql,@paramlist,@OrderBy,@searchText
		
END
