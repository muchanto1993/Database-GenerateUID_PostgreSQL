select length('00117ae940fc46cbb80c1d7e4651b58b'); --32 api id
select length('0011APIKEYSYgBh10QWLMBCLEPw6R3549rAxV7LgfRk8'); --44 api id
select length('0011JWTKEYSYgBh10QWLMBCLEPw6R3549rAxV7LgfRk8'); --44 JWT KEY
select length('wVvnLAaioSCcRR8FJvQxzMBGNEtVTVhlw9SOIJw6SJt'); --43 JWE id

select generate_uid(32);
select generate_uid(44);
select generate_uid(43);
