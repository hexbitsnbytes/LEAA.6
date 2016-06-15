	READ ME
----------------------------------------------------------
	TP02 - Remise 22 juin 2016
	
	2 scripts
		1) WinAdmin: effectue des opérations sur AD
		2) UserList: Affiche des informations sur des utilisateurs
	Opérations à effectuer
	1)	Création de nouveaux utilisateurs.
	2)	Mise à jour de certaines informations d’un compte utilisateur.
	3)	Changement du mot de passe d’un utilisateur.
	4)	Suppression d’un utilisateur.
	5)	Création d’un OU (OrganizationUnit)
	6)	Création de nouveaux groupes.
 	
	Structure du "batch file"
	Code;Arg1;Arg2;Arg3;Arg4;Arg5
	Arg1: Nom d'utilisateur
	Arg2: Prénom
	Arg3: service
	Arg4: Fonction
	Arg5: Mot de passe
	
	Légende:
	MU: Mise à jour des infos de l'utilisateur
	PW: Chagement du PW
	su: Suppression de l'utilisateur
	OU: Création d'une OU
	GR: Création d'un groupe
 
 Contrainte: Doit vérifier l'existence des entités avant toute modifications
 	      Doit créer un fichier log pour répertorier les modifications
			doit répertorier "Succès | échec"
