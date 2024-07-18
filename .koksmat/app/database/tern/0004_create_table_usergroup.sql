/* 
File have been automatically created. To prevent the file from getting overwritten
set the Front Matter property ´keep´ to ´true´ syntax for the code snippet
---
keep: false
---
*/   


-- sure sild

CREATE TABLE public.usergroup
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


);

                -- lollipop
                CREATE TABLE public.usergroup_m2m_user (
                id SERIAL PRIMARY KEY,
                created_at timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
                created_by character varying COLLATE pg_catalog."default"  ,
                updated_at timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
                updated_by character varying COLLATE pg_catalog."default",
                deleted_at timestamp with time zone
                
                    ,usergroup_id int  
 
                    ,user_id int  
 

                );
            

                ALTER TABLE public.usergroup_m2m_user
                ADD FOREIGN KEY (usergroup_id)
                REFERENCES public.usergroup (id) MATCH SIMPLE
                ON UPDATE NO ACTION
                ON DELETE NO ACTION
                NOT VALID;

                ALTER TABLE public.usergroup_m2m_user
                ADD FOREIGN KEY (user_id)
                REFERENCES public.user (id) MATCH SIMPLE
                ON UPDATE NO ACTION
                ON DELETE NO ACTION
                NOT VALID;


---- create above / drop below ----
DROP TABLE IF EXISTS public.usergroup_m2m_user;
DROP TABLE public.usergroup;

