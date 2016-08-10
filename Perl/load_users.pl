#!/usr/bin/perl -w
#   
#   Nom du script : loadusers.pl
#
# Lecture du fichier passwd
use DBI;
use warnings;

$dsn = "DBI:mysql:comptes_linux";
$username = "root";
$password = "crosemont";
$dbh = DBI->connect( $dsn, $username, $password
                        { RaiseError => 1, AutoCommit => 0});
# print "Connecté à la base de données\n";

$sth = $dbh->prepare("INSERT INTO users VALUES (?, ?, ?, ?, ?, ?)"); # sth = Statement Handle Object

open(PASSWD, '/etc/passwd') or die "The file could not be opened: 
Error $?: $!";

while (<PASSWD>) {
    ($nom_user, $x, $id_user, $id_group, $gecos, $working_dir, $exec)=split(/:/);
    $sth->execute( $nom_user, $id_user, $id_group, $gecos, $working_dir, $exec);
}    

close PASSWD;
