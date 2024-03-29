USE [Test]
GO
/****** Object:  StoredProcedure [dbo].[ANDWork]    Script Date: 9/13/2019 10:55:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[ANDWork]
@PageIndex int,
@PageSize int,
@OrderBy nvarchar(50),
@Id int= null,
@Name nvarchar(250) =null,
@Price decimal(18,2)=null,
@Description nvarchar(max)=null,
@ImageUrl nvarchar(250)=null,
@Category nvarchar(50)=null,
@Rating decimal(18,2)=null,
@Weight decimal(18,2)=null,
@IsActive bit=null,
@Width int=null,
@Height int=null




AS
DECLARE @sql nvarchar(max),
		@list nvarchar(2000),
		@nl char(2)=char(13)+char(10)
BEGIN
	
	SET NOCOUNT ON;
	SELECT @sql=
		'SELECT * from Product p where 1=1'+@nl

		IF @Id IS NOT NULL
		SELECT @sql+='AND Id=CONVERT(INT,@Id)' +@nl

		IF @Name IS NOT NULL
		SELECT @sql+='AND Name=@Name' +@nl

		IF @Price IS NOT NULL
		SELECT @sql+='AND Price=CONVERT(decimal(18,2)@Price)' +@nl

		IF @Description IS NOT NULL
		SELECT @sql+='AND Description=@Description' +@nl

		IF @ImageUrl IS NOT NULL
		SELECT @sql+='AND ImageUrl=@ImageUrl' +@nl

		IF @Category IS NOT NULL
		SELECT @sql+='AND Category=@Category' +@nl

		IF @Rating IS NOT NULL
		SELECT @sql+='AND Rating=CONVERT(decimal(18,2),@Rating)' +@nl

		IF @Weight IS NOT NULL
		SELECT @sql+='AND Weight=CONVERT(decimal(18,2)@Weight)' +@nl

		IF @IsActive IS NOT NULL
		SELECT @sql+='AND IsActive=CONVERT(bit,@IsActive)' +@nl

		IF @Width IS NOT NULL
		SELECT @sql+='AND Width=CONVERT(INT,@Width)' +@nl

		IF @Height IS NOT NULL
		SELECT @sql+='AND Height=CONVERT(INT,@Height)' +@nl

		SELECT @sql +='ORDER BY'+ @OrderBy+@nl
		
		SELECT @sql+='OFFSET ('+@PageIndex+'-1) *'+@PageSize+' ROWS
	      FETCH_NEXT'+ @PageSize+' ROWS only;'

		SELECT @list='@PageIndex int,
                           @PageSize int,
                           @OrderBy nvarchar(50),
						   @Id int,
                           @Name nvarchar(250),
						   @Price decimal(18,2),
                           @Description nvarchar(max),
                           @ImageUrl nvarchar(250),
						   @Category nvarchar(50),
						   @Rating decimal(18,2),
						   @Weight decimal(18,2),
						   @IsActive bit,
						   @Width int,
						   @Height int'
	
	EXEC sp_executesql @sql,@list,@PageIndex, @PageSize,@OrderBy,
					   @Id,@Name,@Price,@Description,@ImageUrl,@Category,
					   @Rating,@Weight,@IsActive,@Width,@Height
    
END
