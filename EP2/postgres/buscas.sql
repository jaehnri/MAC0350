\echo --------------------------------------------------------------
\echo -- 2.1) “Quem são os amigo(a)s de Bob”.
\echo --------------------------------------------------------------
\echo 

SELECT p2.id, p2.name from person p1, person_friend pf, person p2
WHERE p1.name = 'Bob'
AND p1.id = pf.person_id
AND p2.id = pf.friend_id; 

\echo 
\echo 
\echo --------------------------------------------------------------
\echo -- 2.2) “Quem tem amizade com Bob”.
\echo --------------------------------------------------------------

SELECT p2.id, p2.name from person p1, person_friend pf, person p2
WHERE p1.name = 'Bob'
AND p1.id = pf.friend_id
AND p2.id = pf.person_id; 

\echo 
\echo 
\echo --------------------------------------------------------------
\echo -- 2.3) “Quem são os amigo(a)s dos amigo(a)s de Alice”
\echo --------------------------------------------------------------
SELECT p2.id, p2.name from person p1, person p2, person_friend pf1, person_friend pf2
WHERE p1.name = 'Alice'
AND p1.id = pf1.person_id
AND pf1.friend_id = pf2.person_id
AND p2.id = pf2.friend_id;

