#### CAPACIDADE ESTADIOS ####
SELECT  APELIDO, CAPACIDADE_ESTADIO 
FROM teams
WHERE APELIDO LIKE '%CELTICS%' 

OR APELIDO LIKE '%HEAT%' 
OR APELIDO LIKE '%LAKERS%'
OR APELIDO LIKE '%nug%'; 

#### ANO DE FUNDAÇÃO ####

SELECT ANO_FUNDACAO, APELIDO
FROM teams
WHERE APELIDO like '%celtics%' 
OR APELIDO like '%LAKERS%' 
OR APELIDO like '%heat%' 
OR APELIDO LIKE '%nug%';


# RECORDES JOGOS EM CASA E FORA

SELECT DISTINCT TEAM_ID, TEAM, G, HOME_RECORD, ROAD_RECORD
FROM ranking
WHERE (TEAM like '%boston%'
OR TEAM LIKE '%laker%'
OR TEAM LIKE '%Miami%'
OR TEAM LIKE '%DENVEr%')
AND (SEASON_ID = 22019) 
AND ( G =59)
ORDER BY G DESC;

### PERCENTUAL INDIVIDUAL DE VITORIAS DOS TIMES ###

SELECT TEAM, (W_PCT * 100) AS W_PCT
FROM ranking
WHERE TEAM like '%boston%' AND SEASON_ID LIKE 22019 limit 1;

SELECT TEAM, (W_PCT * 100) AS W_PCT
FROM ranking
WHERE TEAM like '%miami%' and SEASON_ID like 22019 limit 1;

SELECT TEAM, (W_PCT * 100) AS W_PCT
FROM ranking
WHERE TEAM like '%lakers%' and SEASON_ID like 22019 limit 1;

SELECT TEAM, (W_PCT * 100) AS W_PCT
FROM ranking
WHERE TEAM like '%DENVER%' and SEASON_ID like 22019 limit 1;

#### VITÓRIAS POR TIME ####

SELECT TEAM, W  
FROM ranking
WHERE TEAM like '%lakers%' and SEASON_ID like 22019 limit 1;

SELECT TEAM, W  
FROM ranking
WHERE TEAM like '%boston%' and SEASON_ID like 22019 limit 1;

SELECT TEAM, W  
FROM ranking
WHERE TEAM like '%miami%' and SEASON_ID like 22019 limit 1;

SELECT TEAM, W  
FROM ranking
WHERE TEAM like '%denver%' and SEASON_ID like 22019 limit 1;

### TIME COM A MAIOR PONTUAÇÃO FORA E DENTRO DE CASA ###

select PTS_away, PTS_home, TEAM_ID_away, TEAM_ID_home, SEASON, GAME_ID
from games
WHERE ((TEAM_ID_home = 1610612738
OR TEAM_ID_home = 1610612747
OR TEAM_ID_home = 1610612748
OR TEAM_ID_home = 1610612743) 
OR (TEAM_ID_away = 1610612738
OR TEAM_ID_away = 1610612747
OR TEAM_ID_away = 1610612748
OR TEAM_ID_away = 1610612743))
and SEASON = 2019;

### MAIOR PONTUADOR DO DENVER NUGGETS###

SELECT games_details.PTS, games_details.GAME_ID, games_details.TEAM_ID, games_details.PLAYER_NAME, games.SEASON
FROM games_details
INNER JOIN games ON games.GAME_ID = games_details.GAME_ID
WHERE SEASON = 2019 and TEAM_ID = 1610612743;


### MAIOR PONTUADOR DO LAKERS###

SELECT games_details.PTS, games_details.GAME_ID, games_details.TEAM_ID, games_details.PLAYER_NAME, games.SEASON
FROM games_details
INNER JOIN games ON games.GAME_ID = games_details.GAME_ID
WHERE SEASON = 2019 and TEAM_ID = 1610612747;


### MAIOR PONTUADOR DO BOSTON CELTICS###

SELECT games_details.PTS, games_details.GAME_ID, games_details.TEAM_ID, games_details.PLAYER_NAME, games.SEASON
FROM games_details
INNER JOIN games ON games.GAME_ID = games_details.GAME_ID
WHERE SEASON = 2019 and TEAM_ID = 1610612738;


### MAIOR PONTUADOR DO MIAMI HEAT###

SELECT games_details.PTS, games_details.GAME_ID, games_details.TEAM_ID, games_details.PLAYER_NAME, games.SEASON
FROM games_details
INNER JOIN games ON games.GAME_ID = games_details.GAME_ID
WHERE SEASON = 2019 and TEAM_ID = 1610612748;

### TIME COM A MAIOR PONTUAÇÃO FORA E DENTRO DE CASA ### COM ERRROOOOO AINDA

SELECT games.PTS_home, games.TEAM_ID_away, games.TEAM_ID_home, games.SEASON, games.GAME_ID, games_details.TEAM_ABBREVIATION
FROM games
INNER JOIN games_details ON games.GAME_ID = games_details.GAME_ID
WHERE (TEAM_ID_home = 1610612738
OR games.TEAM_ID_home = 1610612747
OR games.TEAM_ID_home = 1610612748
OR games.TEAM_ID_home = 1610612743)
and SEASON = 2019;

#### NUMERO DE TRIPLO DUPLO JOGADORES ####

SELECT PLAYER_NAME, COUNT(PLAYER_NAME) AS ocorrencias_triplo_duplo
FROM 
(SELECT  
games.GAME_ID,
games_details.TEAM_ID,
games_details.TEAM_ABBREVIATION,
games_details.PLAYER_NAME,
games_details.REB,
games_details.AST,
games_details.PTS,
games.SEASON
FROM 
games_details
INNER JOIN 
games ON games_details.GAME_ID = games.GAME_ID
WHERE
(TEAM_ID = 1610612738 OR TEAM_ID = 1610612743 OR TEAM_ID = 1610612747 OR TEAM_ID = 1610612748)
AND SEASON = 2019
AND REB >=10
AND AST >=10
AND PTS >=10) AS triplo_duplo
GROUP BY PLAYER_NAME
ORDER BY ocorrencias_triplo_duplo DESC;




