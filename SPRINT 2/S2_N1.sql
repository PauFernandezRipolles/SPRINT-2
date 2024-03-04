/*Exercici 1
Mostra totes les transaccions realitzades per empreses d'Alemanya.*/
SELECT transaction.id, company_name as 'Nom'
FROM transaction
JOIN company
ON transaction.company_id=company.id
WHERE company.country = 'germany';
# També es pot fer amb subquery tot i que es menys eficient
SELECT transaction.id, company_name as 'Nom'
FROM transaction
JOIN company
ON transaction.company_id=company.id
WHERE country IN (
	SELECT country
	FROM company
	WHERE company.country = 'germany');
    
/*Exercici 2
Màrqueting està preparant alguns informes de tancaments de gestió, 
et demanen que els passis un llistat de les empreses que han realitzat 
transaccions per una suma superior a la mitjana de totes les transaccions.*/
SELECT distinct(company_name) as 'Nom Empresa'
FROM company
JOIN transaction
ON transaction.company_id=company.id
WHERE company_id IN (
	SELECT company_id
    FROM transaction
    WHERE amount > (
		SELECT AVG(amount)
        FROM transaction
	)
);

/*Exercici 3
El departament de comptabilitat va perdre la informació de les transaccions 
realitzades per una empresa, però no recorden el seu nom, només recorden que 
el seu nom iniciava amb la lletra c. Com els pots ajudar? Comenta-ho acompanyant-ho 
de la informació de les transaccions.*/
SELECT *
FROM transaction
JOIN company
ON transaction.company_id=company.id
WHERE company_name LIKE 'c%'
	OR 'C%'
ORDER BY date(timestamp);
# Els ajudaria adjuntant tota la informació que tenim de les transaccions 
# de les empreses que comencen per 'C', ordenades per data.

/*Exercici 4
Van eliminar del sistema les empreses que no tenen transaccions registrades, 
lliura el llistat d'aquestes empreses.*/
SELECT company_name as'Nom Empresa'
FROM company
LEFT JOIN transaction
ON transaction.company_id=company.id
WHERE transaction.id = null
OR transaction.id  = '';
# No n'hi ha cap que no tingui transaccions registrades

