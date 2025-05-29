#!bin/bash
pg_dump -U postgres -d recipes9 --encoding=UTF-8 > backup250530.sql
