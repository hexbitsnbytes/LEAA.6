#!/usr/bin/perl -w
#   
#   Nom du script : display_users.pl
#
# Lecture du fichier passwd
use DBI;
use warnings;

# Connexion à la base de données comptes_linux
$dsn = "DBI:mysql:comptes_linux";
$username = "root"; 
$password = "crosemont";
$dbh = DBI->connect( $dsn, chomp($username), chomp($password),
                        { RaiseError => 1, AutoCommit => 0});

# Exeécution des instructions mysql en utilisant le module DBI
$sth = $dbh->prepare("SELECT * FROM users"); # sth = Statement Handle Object
$sth->execute();

# Affichage du contenu de la table USERS
print "\n\nRÉSULTATS\n";
print "=============\n";

printf ('%-50s %11s %11s %70s %30s %40s', "nom_user", "id_user", "id_group", "gecos", "working_dir", "exec\n");
print "-" x 176 . "\n";
while (@row = $sth->fetchrow_array()){
    ($nom_user, $id_user, $id_group, $gecos, $working_dir, $exec) = @row;
    printf ('%-50s %11u %11u %70s %30s %40s', @row);
}
