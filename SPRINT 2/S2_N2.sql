/*Exercici 1
En la teva empresa, es planteja un nou projecte per a llançar algunes campanyes 
publicitàries per a fer competència a la companyia Non Institute. Per a això, 
et demanen la llista de totes les transaccions realitzades per empreses que estan 
situades en el mateix país que aquesta companyia.*/
SELECT *
FROM transaction
JOIN company
ON transaction.company_id=company.id
WHERE company.country = (
	SELECT company.country
    FROM company
    WHERE company_name = 'Non Institute'); 
# Els hi facilito tota la informació de les transacions de empreses del mateix pais

/*Exercici 2
El departament de comptabilitat necessita que trobis l'empresa que ha realitzat la 
transacció de major suma en la base de dades.*/
SELECT company.company_name as 'Nom', transaction.amount as 'Import'
FROM company
JOIN transaction
ON transaction.company_id=company.id
WHERE transaction.amount = ( 
	SELECT amount
	FROM transaction
	ORDER BY amount DESC
	LIMIT 1);
