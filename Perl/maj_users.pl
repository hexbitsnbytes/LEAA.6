#!/usr/bin/perl -w
#
#           SCRIPT  : maj_users.pl 
#           Date    : 
# À compléter:  terminer les contrôles et la gestion d'erreur
#               Ajouter le contrôle d'utilisateurs. Ajout des valeurs seulement si le
#               compte n'existe pas déjà.
use DBI;
use warnings;

# Interrogation de l'utilisateur quant au valeurs à inscrire dans la base de données 
print "Entrez l'id de l'utilisateur ";
chomp($id_user = <STDIN>);
die "Enter a valid GID: $!" unless ( $id_user =~ /\d+/);

print "Entrez l'id du groupe: ";
chomp($id_group = <STDIN>);
die "Enter a valid GID: $!" unless ( $id_group =~ /\d+/);

print "Entrez les informations gecos: ";
$gecos = <STDIN>;

print "Entrez le chemin absolu du répertoire de connexion de l'utilisateur: ";
chomp($working_dir = <STDIN>);
die "Enter a valid directory: $!" unless (-d $working_dir);

print "Entrez le chemin du terminal: ";
chomp($exec = <STDIN>);
die "Enter a valid directory: $!" unless (-d $exec);

#Vérifier s'il existe un enregistrement correspondantt


# Connexion à la BD
$dsn = "DBI:mysql:comptes_linux";
$username = "root";
$password = "crosemont";
$dbh = DBI->connect( $dsn, $username, $password
                        { RaiseError => 1, AutoCommit => 0});

# Création des enregistrements dans la base de donnée
$sth = $dbh->prepare("INSERT INTO users VALUES (?, ?, ?, ?, ?, ?)"); # sth = Statement Handle Object
$sth->execute( $nom_user, $id_user, $id_group, $gecos, $working_dir, $exec);

$dsh->disconnect;
