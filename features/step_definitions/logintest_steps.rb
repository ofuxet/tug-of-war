Given /^I have initialized the database$/ do
	# La base de donnees de test est supprimee a chaque fin de test, donc on n'a pas besoin de supprimer tous les champs de la table
	User.create( :name => "Yoann", :password => "meteore", :password_confirmation => "meteore", :email => "seph@kik.com")
end




