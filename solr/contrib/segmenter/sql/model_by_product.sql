/*
 This gives us model information on specific products based on the component pages that this product exists on
*/
USE titan_store_pz;
SET @row_number:=0;
SELECT @row_number:=@row_number+1 AS row_number, cdk.doc_key
# type
 , ( SELECT v.name
 FROM titan_catalog_doc_entity_value v
 JOIN titan_catalog_doc_entity e ON e.value_id = v.id AND e.attribute_id = ( SELECT id FROM titan_catalog_doc_entity_attribute WHERE name = 'type')
 WHERE e.doc_id = doc.id
 ) 'type'
# year
 , ( SELECT v.name
 FROM titan_catalog_doc_entity_value v
 JOIN titan_catalog_doc_entity e ON e.value_id = v.id AND e.attribute_id = ( SELECT id FROM titan_catalog_doc_entity_attribute WHERE name = 'year')
 WHERE e.doc_id = doc.id
 ) 'year'
# make
 , ( SELECT v.name
 FROM titan_catalog_doc_entity_value v
 JOIN titan_catalog_doc_entity e ON e.value_id = v.id AND e.attribute_id = ( SELECT id FROM titan_catalog_doc_entity_attribute WHERE name = 'make')
 WHERE e.doc_id = doc.id
 ) 'make'
# model
 , ( SELECT v.name
 FROM titan_catalog_doc_entity_value v
 JOIN titan_catalog_doc_entity e ON e.value_id = v.id AND e.attribute_id = ( SELECT id FROM titan_catalog_doc_entity_attribute WHERE name = 'model')
 WHERE e.doc_id = doc.id
 ) 'model'
# base model relationship
 , ( SELECT v.name
 FROM titan_catalog_doc_entity_value v
 JOIN titan_catalog_doc_entity e ON e.value_id = v.id AND e.attribute_id = ( SELECT id FROM titan_catalog_doc_entity_attribute WHERE name = 'base_model')
 WHERE e.doc_id = doc.id
 ) 'base_model'
 , ( SELECT v.name
 FROM titan_catalog_doc_entity_value v
 JOIN titan_catalog_doc_entity e ON e.value_id = v.id AND e.attribute_id = ( SELECT id FROM titan_catalog_doc_entity_attribute WHERE name = 'size')
 WHERE e.doc_id = doc.id
 ) 'size'
-- ,( SELECT titan_catalog_doc_key.doc_key
-- FROM titan_catalog_doc_key
--  WHERE doc_key_hash = SHA1('product/honda/17215-HL4-A02')
--  ) 'hash'
 FROM titan_catalog catl
JOIN titan_catalog_doc doc ON doc.catalog_id = catl.parent_id
JOIN titan_catalog_doc_key cdk ON cdk.id = catl.doc_key_id
WHERE catl.id IN (
 SELECT doc.catalog_id
 FROM titan_catalog_doc doc
 JOIN titan_catalog_doc_key path ON path.id = doc.doc_key_id
-- WHERE path.doc_key_hash = SHA1('product/honda/17215-HL4-A02')
WHERE path.doc_key_hash like SHA('catalog/honda/motorcycle/1984/vt500c-ac-shadow-500/clutch')

 -- WHERE path.doc_key LIKE '%Honda%' AND path.doc_key LIKE '%250X%' AND path.doc_key LIKE '%ATV%' AND path.doc_key LIKE '%2016%'
 )
ORDER BY ( SELECT v.name
 FROM titan_catalog_doc_entity_value v
 JOIN titan_catalog_doc_entity e ON e.value_id = v.id AND e.attribute_id = ( SELECT id FROM titan_catalog_doc_entity_attribute WHERE name = 'model')
 WHERE e.doc_id = doc.id
 ), ( SELECT v.name
 FROM titan_catalog_doc_entity_value v
 JOIN titan_catalog_doc_entity e ON e.value_id = v.id AND e.attribute_id = ( SELECT id FROM titan_catalog_doc_entity_attribute WHERE name = 'year')
 WHERE e.doc_id = doc.id
 ), (SELECT row_number )
;