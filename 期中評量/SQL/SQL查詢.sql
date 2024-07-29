USE [Northwind]

--1 列出各產品的供應商名稱

SELECT 
    p.ProductName,
    s.CompanyName AS SupplierName
FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID

--2 列出各產品的種類名稱
SELECT 
    p.ProductID,
    p.ProductName,
    c.CategoryID,
    c.CategoryName
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
ORDER BY p.ProductID

--3 列出各訂單的顧客名字
SELECT 
    o.OrderID,
    c.CustomerID,
    c.ContactName AS CustomerName
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
ORDER BY o.OrderID

--4 列出各訂單的所負責的物流商名字以及員工名字
SELECT 
    o.OrderID,
    s.CompanyName AS ShipperName,
    e.FirstName + ' ' + e.LastName AS EmployeeName
FROM Orders o
JOIN Shippers s ON o.ShipVia = s.ShipperID
JOIN Employees e ON o.EmployeeID = e.EmployeeID
ORDER BY o.OrderID

--5 列出1998年的訂單
SELECT 
    OrderID, 
    CustomerID, 
    OrderDate
FROM Orders
WHERE YEAR(OrderDate) = 1998
ORDER BY OrderDate

--6 各產品，UnitsInStock < UnitsOnOrder 顯示'供不應求'，否則顯示'正常'
SELECT 
    ProductID, 
    ProductName, 
    UnitsInStock, 
    UnitsOnOrder,
    CASE 
        WHEN UnitsInStock < UnitsOnOrder THEN '供不應求'
        ELSE '正常'
    END AS StockStatus
FROM Products

--7 取得訂單日期最新的9筆訂單
SELECT TOP 9 
    OrderID, 
    CustomerID, 
    OrderDate
FROM Orders
ORDER BY OrderDate DESC

--8 產品單價最便宜的第4~8名
SELECT 
    ProductID, 
    ProductName, 
    UnitPrice
FROM Products
ORDER BY UnitPrice ASC
OFFSET 3 ROWS FETCH NEXT 5 ROWS ONLY

--9 列出每種類別中最高單價的商品
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

--10 列出每個訂單的總金額
SELECT 
    od.OrderID,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS TotalAmount
FROM [Order Details] od
GROUP BY od.OrderID
ORDER BY od.OrderID

--11 列出每個物流商送過的訂單筆數
SELECT 
    s.ShipperID,
    s.CompanyName,
    COUNT(o.OrderID) AS OrderCount
FROM Shippers s
LEFT JOIN  Orders o ON s.ShipperID = o.ShipVia
GROUP BY s.ShipperID, s.CompanyName
ORDER BY OrderCount DESC

--12 列出被下訂次數小於9次的產品
SELECT 
    p.ProductID,
    p.ProductName,
    COUNT(od.OrderID) AS OrderCount
FROM Products p
LEFT JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
HAVING COUNT(od.OrderID) < 9
ORDER BY OrderCount

-- (13、14、15請一起寫)
--13 新增物流商(Shippers)：
-- 公司名稱: 青杉人才，電話: (02)66057606
-- 公司名稱: 青群科技，電話: (02)14055374
INSERT INTO Shippers (CompanyName, Phone)
VALUES ('青杉人才', '(02)66057606')
INSERT INTO Shippers (CompanyName, Phone)
VALUES ('青群科技', '(02)14055374')

--14 方才新增的兩筆資料，電話都改成(02)66057606，公司名稱結尾加'有限公司'
UPDATE Shippers
SET Phone = '(02)66057606', CompanyName = '青杉人才有限公司'
WHERE CompanyName = '青杉人才'
UPDATE Shippers
SET Phone = '(02)66057606', CompanyName = '青群科技有限公司'
WHERE CompanyName = '青群科技'

--15 刪除剛才兩筆資料
DELETE FROM Shippers
WHERE CompanyName = '青杉人才有限公司'
DELETE FROM Shippers
WHERE CompanyName = '青群科技有限公司'