#!/usr/bin/perl -w
#   
#   Nom du script : loadusers.pl
#
# 
use DBI;
use warnings;

# Connexion à la base de données comptes_linux
$dsn = "DBI:mysql:comptes_linux";
print "Entrez un utilisateur pour vous connecter à la base de données: ";
$username = chomp(<STDIN>);
print "Entrez le mot de passe correspondant: ";
$password = chomp(<STDIN>);
$dbh = DBI->connect( $dsn, $username, $password
                        { RaiseError => 1, AutoCommit => 0});


$sth = $dbh->prepare("INSERT INTO users VALUES (?, ?, ?, ?, ?, ?)"); # sth = Statement Handle Object

# Lecture du fichier /etc/passwd 
open(PASSWD, '/etc/passwd') or die "The file could not be opened: 
Error $?: $!";

# Ajout du contenu de /etc/passwd sous forme d'enregistrements dans dans la base de donnée
while (<PASSWD>) {
    ($nom_user, $x, $id_user, $id_group, $gecos, $working_dir, $exec)=split(/:/);
    $sth->execute( $nom_user, $id_user, $id_group, $gecos, $working_dir, $exec);
}    

$dbh->disconnect;
close PASSWD;
