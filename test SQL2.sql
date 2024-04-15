-- Given table with 2 columns: buyer and item. Buyer contains the name of buyer, Item contains the name of item bought
-- Return the name of items that is neither bought the most, nor bought the least.

CREATE TABLE item_bought (
    buyer TEXT NOT NULL,
    item TEXT NOT NULL
);

INSERT INTO item_bought (buyer, item) VALUES
('A', 'Asus'),
('B', 'Lenovo'),
('C', 'Lenovo'),
('D', 'Acer'),
('E', 'Acer'),
('F', 'Acer');

SELECT * FROM item_bought;
SELECT item FROM item_bought GROUP BY item
HAVING COUNT(*)> (
    SELECT MIN(jumlah_kolom) FROM (
		SELECT COUNT(*) AS jumlah_kolom FROM item_bought GROUP BY item) AS kolom_paling_sedikit)
AND COUNT(*)< (
    SELECT MAX(jumlah_kolom) FROM (
        SELECT COUNT(*) AS jumlah_kolom FROM item_bought GROUP BY item) AS kolom_paling_banyak);
	