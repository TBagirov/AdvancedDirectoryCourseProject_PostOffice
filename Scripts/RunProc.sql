-- ������ �������� ��������

-- "��� ������������"
set noexec off
go

-- ����������� � ������ ��
use PostOffice
go

select * from SubscribesView;


-- ��������� �������� � ��
exec EachPubAmount;

-- ������ � ���������� null � ���
exec AddressPostman '��.���������', '1', 11;
exec AddressPostman '��.���������', '12', null;

exec SubscribersNewspapers '��������', '������', '�����������';
exec SubscribersNewspapers '��������', '������',  '���������';

exec PostmansAmount;

exec TopPubsDistrict;

exec SubscribesAverageTerms;


 

