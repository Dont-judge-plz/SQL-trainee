Вывести информацию (автора, название и цену) о  книгах, цены которых меньше или равны средней цене книг на складе. 
Информацию вывести в отсортированном по убыванию цены виде. 
Среднее вычислить как среднее по цене книги.
SELECT author,title, price 
FROM book
WHERE price <= (SELECT AVG(price)               
FROM book)
ORDER BY price DESC;

Вывести информацию (автора, название и цену) о тех книгах, цены которых превышают минимальную цену книги на складе 
не более чем на 150 рублей в отсортированном по возрастанию цены виде.
SELECT author, title, price
FROM book
WHERE price <= (SELECT MIN(price)+150 FROM book)
ORDER BY price ASC;

Вывести информацию (автора, книгу и количество) о тех книгах, количество экземпляров которых в таблице book не дублируется.
SELECT author,title, amount
FROM book
WHERE amount IN (SELECT amount
                FROM book
                GROUP BY amount
                HAVING COUNT(amount) = 1
                );

                
