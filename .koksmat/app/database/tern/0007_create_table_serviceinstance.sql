/* 
File have been automatically created. To prevent the file from getting overwritten
set the Front Matter property ´keep´ to ´true´ syntax for the code snippet
---
keep: false
---
*/   


-- sure sild

CREATE TABLE public.serviceinstance
(
    id SERIAL PRIMARY KEY,
    created_at timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by character varying COLLATE pg_catalog."default"  ,

    updated_at timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_by character varying COLLATE pg_catalog."default" ,

    deleted_at timestamp with time zone
    ,tenant character varying COLLATE pg_catalog."default"  NOT NULL
    ,searchindex character varying COLLATE pg_catalog."default"  NOT NULL
    ,name character varying COLLATE pg_catalog."default"  NOT NULL
    ,description character varying COLLATE pg_catalog."default" 
    ,service_id int   NOT NULL
    ,owner_id int   NOT NULL
    ,responsible_id int   NOT NULL
    ,consulted_id int  
    ,informed_id int  
    ,data JSONB  


);

                ALTER TABLE IF EXISTS public.serviceinstance
                ADD FOREIGN KEY (service_id)
                REFERENCES public.service (id) MATCH SIMPLE
                ON UPDATE NO ACTION
                ON DELETE NO ACTION
                NOT VALID;                ALTER TABLE IF EXISTS public.serviceinstance
                ADD FOREIGN KEY (owner_id)
                REFERENCES public.user (id) MATCH SIMPLE
                ON UPDATE NO ACTION
                ON DELETE NO ACTION
                NOT VALID;                ALTER TABLE IF EXISTS public.serviceinstance
                ADD FOREIGN KEY (responsible_id)
                REFERENCES public.user (id) MATCH SIMPLE
                ON UPDATE NO ACTION
                ON DELETE NO ACTION
                NOT VALID;                ALTER TABLE IF EXISTS public.serviceinstance
                ADD FOREIGN KEY (consulted_id)
                REFERENCES public.usergroup (id) MATCH SIMPLE
                ON UPDATE NO ACTION
                ON DELETE NO ACTION
                NOT VALID;                ALTER TABLE IF EXISTS public.serviceinstance
                ADD FOREIGN KEY (informed_id)
                REFERENCES public.usergroup (id) MATCH SIMPLE
                ON UPDATE NO ACTION
                ON DELETE NO ACTION
                NOT VALID;


---- create above / drop below ----

DROP TABLE public.serviceinstance;

