	READ ME
----------------------------------------------------------
	TP02 - Remise 22 juin 2016
	
	2 scripts
		1) WinAdmin: effectue des op�rations sur AD
		2) UserList: Affiche des informations sur des utilisateurs
	Op�rations � effectuer
	1)	Cr�ation de nouveaux utilisateurs.
	2)	Mise � jour de certaines informations d�un compte utilisateur.
	3)	Changement du mot de passe d�un utilisateur.
	4)	Suppression d�un utilisateur.
	5)	Cr�ation d�un OU (OrganizationUnit)
	6)	Cr�ation de nouveaux groupes.
 	
	Structure du "batch file"
	Code;Arg1;Arg2;Arg3;Arg4;Arg5
	Arg1: Nom d'utilisateur
	Arg2: Pr�nom
	Arg3: service
	Arg4: Fonction
	Arg5: Mot de passe
	
	L�gende:
	MU: Mise � jour des infos de l'utilisateur
	PW: Chagement du PW
	su: Suppression de l'utilisateur
	OU: Cr�ation d'une OU
	GR: Cr�ation d'un groupe
 
 Contrainte: Doit v�rifier l'existence des entit�s avant toute modifications
 	      Doit cr�er un fichier log pour r�pertorier les modifications
			doit r�pertorier "Succ�s | �chec"
