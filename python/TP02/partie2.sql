# =================================================
# III - Création d'une base de données "utilisateurs avec un script SQL"
# =================================================

# Creer une base de données "utilisateurs"
# Avec comme table "users" 

# Avec la structure suivante :
CREATE TABLE users (
    user char(20) not null primary key,
    fil1 char(1),
    uid int,
    gid int,
    infos char(30),
    rep_home char(30),
    prog_login char(30)
);

# Charger la table avec load data


