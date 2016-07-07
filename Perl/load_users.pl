#!/usr/bin/perl -w
#   
#   Nom du script : loadusers.pl
#
# Lecture du fichier passwd
use DBI;

# Quand dois-je fermer le fichier?:w
open(PASSWD, '/etc/passwd');
while (<PASSWD>)
{
    ($nom_user, $id_user, $id_group, $gecos, $working_dir, $exec)=split(/:/);
}

# Chargement des données dans la table <users> de la DB <comptes_linux>.
# Est-ce que je dois utiliser un compte local? Ou utiliser un compte créé dans Mariadb?
$dsn = "DBI:mysql:comptes_linux";
$username = "root";
$password = "crosemont";
$dbh = DBI->connect($dsn,$username,$password);
 print "Connecté à la base de données\n";
