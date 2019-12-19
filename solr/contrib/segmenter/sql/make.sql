SELECT DISTINCT LOWER(v.name) vehicle_make FROM titan_catalog_doc_entity_value v JOIN titan_catalog_doc_entity e ON e.value_id = v.id AND e.attribute_id = ( SELECT id FROM titan_catalog_doc_entity_attribute WHERE name = 'make') ORDER BY v.name;

