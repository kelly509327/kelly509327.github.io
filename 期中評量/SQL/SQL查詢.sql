USE [Northwind]

--1 �C�X�U���~�������ӦW��

SELECT 
    p.ProductName,
    s.CompanyName AS SupplierName
FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID

--2 �C�X�U���~�������W��
SELECT 
    p.ProductID,
    p.ProductName,
    c.CategoryID,
    c.CategoryName
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
ORDER BY p.ProductID

--3 �C�X�U�q�檺�U�ȦW�r
SELECT 
    o.OrderID,
    c.CustomerID,
    c.ContactName AS CustomerName
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
ORDER BY o.OrderID

--4 �C�X�U�q�檺�ҭt�d�����y�ӦW�r�H�έ��u�W�r
SELECT 
    o.OrderID,
    s.CompanyName AS ShipperName,
    e.FirstName + ' ' + e.LastName AS EmployeeName
FROM Orders o
JOIN Shippers s ON o.ShipVia = s.ShipperID
JOIN Employees e ON o.EmployeeID = e.EmployeeID
ORDER BY o.OrderID

--5 �C�X1998�~���q��
SELECT 
    OrderID, 
    CustomerID, 
    OrderDate
FROM Orders
WHERE YEAR(OrderDate) = 1998
ORDER BY OrderDate

--6 �U���~�AUnitsInStock < UnitsOnOrder ���'�Ѥ����D'�A�_�h���'���`'
SELECT 
    ProductID, 
    ProductName, 
    UnitsInStock, 
    UnitsOnOrder,
    CASE 
        WHEN UnitsInStock < UnitsOnOrder THEN '�Ѥ����D'
        ELSE '���`'
    END AS StockStatus
FROM Products

--7 ���o�q�����̷s��9���q��
SELECT TOP 9 
    OrderID, 
    CustomerID, 
    OrderDate
FROM Orders
ORDER BY OrderDate DESC

--8 ���~����̫K�y����4~8�W
SELECT 
    ProductID, 
    ProductName, 
    UnitPrice
FROM Products
ORDER BY UnitPrice ASC
OFFSET 3 ROWS FETCH NEXT 5 ROWS ONLY

--9 �C�X�C�����O���̰�������ӫ~
SELECT 
    c.CategoryName,
    p.ProductName,
    p.UnitPrice
FROM Categories c
JOIN Products p ON c.CategoryID = p.CategoryID
WHERE 
    p.UnitPrice = (
        SELECT MAX(p2.UnitPrice)
        FROM Products p2
        WHERE p2.CategoryID = p.CategoryID
    )
ORDER BY c.CategoryName

--10 �C�X�C�ӭq�檺�`���B
SELECT 
    od.OrderID,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS TotalAmount
FROM [Order Details] od
GROUP BY od.OrderID
ORDER BY od.OrderID

--11 �C�X�C�Ӫ��y�Ӱe�L���q�浧��
SELECT 
    s.ShipperID,
    s.CompanyName,
    COUNT(o.OrderID) AS OrderCount
FROM Shippers s
LEFT JOIN  Orders o ON s.ShipperID = o.ShipVia
GROUP BY s.ShipperID, s.CompanyName
ORDER BY OrderCount DESC

--12 �C�X�Q�U�q���Ƥp��9�������~
SELECT 
    p.ProductID,
    p.ProductName,
    COUNT(od.OrderID) AS OrderCount
FROM Products p
LEFT JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
HAVING COUNT(od.OrderID) < 9
ORDER BY OrderCount

-- (13�B14�B15�Ф@�_�g)
--13 �s�W���y��(Shippers)�G
-- ���q�W��: �C���H�~�A�q��: (02)66057606
-- ���q�W��: �C�s��ޡA�q��: (02)14055374
INSERT INTO Shippers (CompanyName, Phone)
VALUES ('�C���H�~', '(02)66057606')
INSERT INTO Shippers (CompanyName, Phone)
VALUES ('�C�s���', '(02)14055374')

--14 ��~�s�W���ⵧ��ơA�q�ܳ��令(02)66057606�A���q�W�ٵ����['�������q'
UPDATE Shippers
SET Phone = '(02)66057606', CompanyName = '�C���H�~�������q'
WHERE CompanyName = '�C���H�~'
UPDATE Shippers
SET Phone = '(02)66057606', CompanyName = '�C�s��ަ������q'
WHERE CompanyName = '�C�s���'

--15 �R����~�ⵧ���
DELETE FROM Shippers
WHERE CompanyName = '�C���H�~�������q'
DELETE FROM Shippers
WHERE CompanyName = '�C�s��ަ������q'