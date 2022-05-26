-- Запрос 1.
--	Определить наименование и количество экземпляров всех изданий, получаемых отделением связи.
ALTER   proc [dbo].[EachPubAmount]
as begin
    select
		Title
		,Count(Title) as Amount
	from 
		SubscribesView
	group by 
		Title
	order by Amount desc 
end

--  Запрос 2.
--	По заданному адресу определить фамилию почтальона, обслуживающего подписчика.
ALTER   proc [dbo].[AddressPostman] 
		@street nvarchar(50),
		@building nvarchar(5),
		@apartment int
as begin
	select
		Surname + N' ' + N' ' + Substring(Name, 1, 1) 
				  + N'.' + Substring(Patronymic, 1, 1) 
				  + N'.' as Subscriber
		,Street
		,Building
		,Apartment
		,Postman
	from
		SubscribersView
	where
		Street = @street and Building = @building and IsNull(Apartment,0) = IsNull(@apartment,0);
end

ALTER   proc [dbo].[SubscribesAverageTerms]
as begin
	select
		SubscribesView.PubIndex
		,SubscribesView.PubType
		,SubscribesView.Title 
		,AVG(Duration) as AvgDuration
	from
		SubscribesView
	group by
		PubType, Title, PubIndex
	order by AvgDuration desc;
end


--  Запрос 4.
--	Сколько почтальонов работает в почтовом отделении?
ALTER   proc [dbo].[PostmansAmount]
as begin
	select
		COUNT(Id) as TotalPostmans
	from
		Postmans;
end


--  Запрос 5.
--	На каком участке количество экземпляров подписных изданий максимально?
ALTER   proc [dbo].[TopPubsDistrict]
as begin
	select top(1)
		SubscribesView.IdDistrict
		,SubscribesView.RegionName
		,COUNT(IdDistrict) as Amount
	from
		SubscribesView
	group by 
		IdDistrict, RegionName
	order by Amount desc;
end


ALTER   proc [dbo].[SubscribersNewspapers]
		@surname     nvarchar(60),
		@name        nvarchar(60),
		@patronymic  nvarchar(60)
as begin
	select
		Surname
		,[Name]
		,Patronymic
		,Title
	from
		SubscribesView
	where 
		[Name] = @name and Surname = @surname and Patronymic = @patronymic and PubType = 'Газета'
end
