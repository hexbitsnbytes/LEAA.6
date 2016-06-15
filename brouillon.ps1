#
#	Script: WinAdmin
#

# déclaration des fonctions qui effectuent les opérations
function create_user { New-ADUser -name $user -AccountPassword $pw -Department $dept } 

# La fonction update_user a des paramètres facultatifs... COMMENT FAIRE?
function update_user { Set-ADuser -identity $user }

function change_pw { Set-ADAccountPassword -identity $user -NewPassword $pw }

function delete_user { Remove-ADUser -Identity $user }

function create_ou { New-ADOrganizationalUnit -Name $user }

function create_gr { New-ADGroup -Name $user }

$batch_file=".\batch.txt"

# Vérifier l'opération à effectuer
function administrative_action {
	switch($code)
	{
		cu { create_user } 
		mu { update_user }
		pw { change_pw }
		su { delete_user }
		ou { create_ou }
		gr { create_gr }
	}
}

#Enregistrement des informations du fichier batch
cat $batch_file | foreach {
	($code,$user,$name,$dept,$title,$pw) = $_.split(";")
	$pw= ConvertTo-SecureString -String $pw -asPlainText -force 
	administrative_action
}
