SELECT DISTINCT LOWER(v.name) vehicle_size FROM titan_catalog_doc_entity_value v JOIN titan_catalog_doc_entity e ON e.value_id = v.id AND e.attribute_id = ( SELECT id FROM titan_catalog_doc_entity_attribute WHERE name = 'size') ORDER BY v.name;

