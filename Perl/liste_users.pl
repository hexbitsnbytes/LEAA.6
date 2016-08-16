#!/usr/bin/perl -w
#   
#   Nom du script : info_users.pl 
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
$format = '%-20s %11s %11s %70s %30s %15s';
print "\n\nRÉSULTATS\n\n";
print "=" x 184 . "\n";

printf ( $format, "\nnom_user", "id_user", "id_group", "gecos", "working_dir", "exec\n");
print "\n" . "-" x 184 . "\n";
while (@row = $sth->fetchrow_array()){
    ($nom_user, $id_user, $id_group, $gecos, $working_dir, $exec) = @row;
    printf ( $format, @row);
}
$dbh->disconnect;
