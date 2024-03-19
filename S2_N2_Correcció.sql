/*Exercici 1
En la teva empresa, es planteja un nou projecte per a llançar algunes campanyes 
publicitàries per a fer competència a la companyia Non Institute. Per a això, 
et demanen la llista de totes les transaccions realitzades per empreses que estan 
situades en el mateix país que aquesta companyia.*/
# CORRECCIÓ: Sense utilitzar Join
SELECT *
FROM transaction, company
WHERE transaction.company_id=company.id AND
	company.country = (
	SELECT company.country
    FROM company
    WHERE company_name = 'Non Institute'); 
# Els hi facilito tota la informació de les transacions de empreses del mateix pais

/*Exercici 2
El departament de comptabilitat necessita que trobis l'empresa que ha realitzat la 
transacció de major suma en la base de dades.*/
#CORRECCIÓ: Sense Join
SELECT company.company_name as 'Nom', transaction.amount as 'Import'
FROM company, transaction
WHERE transaction.company_id=company.id AND
	transaction.amount = ( 
	SELECT amount
	FROM transaction
	ORDER BY amount DESC
	LIMIT 1);
