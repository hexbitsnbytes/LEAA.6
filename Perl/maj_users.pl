#!/usr/bin/perl -w
#
#           SCRIPT  : maj_users.pl 
#           Date    : 
# À compléter:  terminer les contrôles et la gestion d'erreur
#               Ajouter le contrôle d'utilisateurs. Ajout des valeurs seulement si le
#               compte n'existe pas déjà.
use DBI;


# Connexion à la BD
$dsn = "DBI:mysql:comptes_linux";
$username = "root";
$password = "crosemont";
$dbh = DBI->connect( $dsn, $username, $password
                        { RaiseError => 1, AutoCommit => 0});
                    
$sth = $dbh->prepare("select * FROM users WHERE nom_user=?");
# Contrôle de la préexistence de l'utilisateur dans la base de donnée
print "Entrez le nom de l'utilisateur: ";
$nom_user = <STDIN>;
$nom_user = chomp($nom_user);
$sth->execute($nom_user);
#if ($sth->execute($nom_user) ne '') { print "L'utilisateur existe déjà"};
#$sqlerr = $sth->err;
#print "Erreur" unless ($sqlerr == 0);

# Contrôle de l'existence de l'utilisateur dans les sytème à l'aide d'un appel système
$test_user = system("getent passwd $nom_user"); 
die "Veuillez entrer un utilisateur valide" unless ($? == 0);


# Interrogation de l'utilisateur quant au valeurs à inscrire dans la base de données 
print "Entrez l'id de l'utilisateur: ";
$id_user = <STDIN>;
die "Enter a valid UID: $!" unless ( $id_user =~ /\d+/);

print "Entrez l'id du groupe: ";
$id_group = <STDIN>;
$test_group = system("getent group $id_group"); 
die "Veuillez entrer un groupe valide" unless ($? == 0);

print "Entrez les informations gecos: ";
$gecos = <STDIN>;

print "Entrez le chemin absolu du répertoire de connexion de l'utilisateur: ";
$working_dir = <STDIN>;
die "Enter a valid directory: $!" unless (-d $working_dir);

print "Entrez le chemin du terminal: ";
$exec = <STDIN>;
die "Enter a valid directory: $!" unless (-d $exec);


# Création des enregistrements dans la base de donnée
$sth = $dbh->prepare("INSERT INTO users VALUES (?, ?, ?, ?, ?, ?)"); # sth = Statement Handle Object
$sth->execute( $nom_user, $id_user, $id_group, $gecos, $working_dir, $exec);

$dsh->disconnect;
