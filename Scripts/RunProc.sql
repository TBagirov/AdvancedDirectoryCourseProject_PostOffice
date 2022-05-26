-- Запуск процедур процедур

-- "нет невыполнению"
set noexec off
go

-- подклучение к нужной БД
use PostOffice
go

select * from SubscribesView;


-- Процедуры запросов к БД
exec EachPubAmount;

-- Пример с параметром null и без
exec AddressPostman 'пр.Ленинский', '1', 11;
exec AddressPostman 'ул.Куйбышева', '12', null;

exec SubscribersNewspapers 'Дроздова', 'Марина', 'Григорьевна';
exec SubscribersNewspapers 'Тарапата', 'Михаил',  'Исаакович';

exec PostmansAmount;

exec TopPubsDistrict;

exec SubscribesAverageTerms;


 

