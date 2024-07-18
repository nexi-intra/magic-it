/* 
File have been automatically created. To prevent the file from getting overwritten
set the Front Matter property ´keep´ to ´true´ syntax for the code snippet
---
keep: false
---
*/   


-- tomat sild

CREATE OR REPLACE PROCEDURE proc.create_serviceinstance(
    p_actor_name VARCHAR,
    p_params JSONB,
    OUT p_id INTEGER
)
LANGUAGE plpgsql
AS $BODY$
DECLARE
       v_rows_updated INTEGER;
v_tenant VARCHAR COLLATE pg_catalog."default" ;
    v_searchindex VARCHAR COLLATE pg_catalog."default" ;
    v_name VARCHAR COLLATE pg_catalog."default" ;
    v_description VARCHAR COLLATE pg_catalog."default";
    v_service_id INTEGER;
    v_owner_id INTEGER;
    v_responsible_id INTEGER;
    v_consulted_id INTEGER;
    v_informed_id INTEGER;
    v_data JSONB;
        v_audit_id integer;  -- Variable to hold the OUT parameter value
    p_auditlog_params jsonb;

BEGIN
    v_tenant := p_params->>'tenant';
    v_searchindex := p_params->>'searchindex';
    v_name := p_params->>'name';
    v_description := p_params->>'description';
    v_service_id := p_params->>'service_id';
    v_owner_id := p_params->>'owner_id';
    v_responsible_id := p_params->>'responsible_id';
    v_consulted_id := p_params->>'consulted_id';
    v_informed_id := p_params->>'informed_id';
    v_data := p_params->>'data';
         

    INSERT INTO public.serviceinstance (
    id,
    created_at,
    updated_at,
        created_by, 
        updated_by, 
        tenant,
        searchindex,
        name,
        description,
        service_id,
        owner_id,
        responsible_id,
        consulted_id,
        informed_id,
        data
    )
    VALUES (
        DEFAULT,
        DEFAULT,
        DEFAULT,
        p_actor_name, 
        p_actor_name,  -- Use the same value for updated_by
        v_tenant,
        v_searchindex,
        v_name,
        v_description,
        v_service_id,
        v_owner_id,
        v_responsible_id,
        v_consulted_id,
        v_informed_id,
        v_data
    )
    RETURNING id INTO p_id;

       p_auditlog_params := jsonb_build_object(
        'tenant', '',
        'searchindex', '',
        'name', 'create_serviceinstance',
        'status', 'success',
        'description', '',
        'action', 'create_serviceinstance',
        'entity', 'serviceinstance',
        'entityid', -1,
        'actor', p_actor_name,
        'metadata', p_params
    );
/*###MAGICAPP-START##
{
   "$schema": "https://json-schema.org/draft/2020-12/schema",
  "$id": "https://booking.services.koksmat.com/.schema.json",
   
  "type": "object",

  "title": "Create ServiceInstance",
  "description": "Create operation",

  "properties": {
  
    "tenant": { 
    "type": "string",
    "description":"" },
    "searchindex": { 
    "type": "string",
    "description":"Search Index is used for concatenating all searchable fields in a single field making in easier to search\n" },
    "name": { 
    "type": "string",
    "description":"" },
    "description": { 
    "type": "string",
    "description":"" },
    "service_id": { 
    "type": "number",
    "description":"" },
    "owner_id": { 
    "type": "number",
    "description":"" },
    "responsible_id": { 
    "type": "number",
    "description":"" },
    "consulted_id": { 
    "type": "number",
    "description":"" },
    "informed_id": { 
    "type": "number",
    "description":"" },
    "data": { 
    "type": "object",
    "description":"" }

    }
}

##MAGICAPP-END##*/

    -- Call the create_auditlog procedure
    CALL proc.create_auditlog(p_actor_name, p_auditlog_params, v_audit_id);
END;
$BODY$
;




