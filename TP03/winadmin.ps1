#
#	Script: WinAdmin.ps1
#
#	Voir ./Readme.txt pour les contraintes à respecter
#
#	À FAIRE: utiliser ce format pour la suppression d'utilisateur :: Get-ADUser "cn=glenjohn,dc=appnc" -Server Lds.Fabrikam.com:50000 | Remove-ADUser
#
# Valeur à modifier en fonction de l'environnement dans lequel WinAdmin.ps1 est exécuté
$domain_name="dc=GAUTHIERLNG"
$domaine_postfix="dc=net"
$logfile=".\log.txt"
$batch_file=".\batch.txt"
$domain_path="$domain_name,$domain_postfix"

# déclaration des fonctions qui effectuent les opérations
function create_user { New-ADUser -name $user -AccountPassword $pw -Department $dept } 

function update_user { Set-ADuser -identity $user }

function change_pw { Set-ADAccountPassword -identity $user -NewPassword $pw }

function delete_user { Remove-ADUser -Identity $user -confirm }

function create_ou { New-ADOrganizationalUnit -Name $user }

function create_gr { New-ADGroup -Name $user -path "ou=$name,$domain_path" }


# Fonctions relatives à la journalisation
$visuals="****************************************"

function actions-logging {
	echo $visuals;
	echo (date);
	echo "Action effectuée: $code $user $name $dept $title"
}

function logging {
	actions-logging | out-file -append $logfile
}

function error-logging {
		echo $visuals;
		echo (date);
		echo "Erreur: $_";
		echo "Opération échouée: $code,$user$name,$dept,$title"
}

function logg {
	error-logging | out-file -append $logfile
}

# Fonction qui vérifie quelle fonction doit être exécutée en fonction de la valeur du premier argument du fichier batch
function administrative_action {
	switch($code)
	{
		cu {	
			$pw= ConvertTo-SecureString -String $pw -asPlainText -force
		 	create_user 
			logging
		} 
		mu {
			$pw= ConvertTo-SecureString -String $pw -asPlainText -force
			update_user
			logging
		 }
		pw { 
			$pw= ConvertTo-SecureString -String $pw -asPlainText -force
			change_pw
			logging
		}
		su { 
			delete_user
			logging
		}
		ou { 
			create_ou
			logging
		}
		gr { 
			create_gr
			logging
		}
	}
}

#Enregistrement des informations du fichier batch
cat $batch_file | foreach {
	($code,$user,$name,$dept,$title,$pw) = $_.split(";")
	try {
	administrative_action
	}
	catch {	
	logg	
	}
}



