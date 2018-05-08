lien prod : https://eventbrite-thp-bdx.herokuapp.com/

# Week 6 - Day 2 - THP by Team BDX - EventBrite with Devise and Stripe


## Cher correcteur/trice, j'espère que mon app te plaira ! Merci d'avance du temps précieux que tu passeras dessus à la tester. :)


## Projet du jour :

Le projet du jour consiste a construire une application compatible Heroku, qui permet de gérer des évènements sur une plateforme. Ces évènements sont créés et gérés par des utilisateurs. Le but est de déployer les méthodes vues précédement, alias CRUD, push sur Heroku, création de modèles/controllers/helpers/routes... Mais cette fois-ci on y rajoute les gems Devise pour l'authentification et Stripe pour la gestion du paiement des inscriptions aux events !

## Pré-requis et installation :

Cloner le repo et coller cette commande :

```
  $ bundle install --without production && rails db:migrate
```


## Fonctionnement de l'application :

Pour tester l'application, deux choix s'offrent à vous :

 - En local :

Une fois placé(e) dans le dossier souhaité, effectuer la commande suivante :
```
  $ rails s
```
Vous pouvez maintenant observer le fonctionnement de l'application (console of course) via l'adresse :
```
  @ http://localhost:3000/
```

  - Ou sur le site déployé :


```
  @ https://eventbrite-thp-bdx.herokuapp.com/
```


*NOTA : $ = terminal || > = console rails || @ = web browser*

## Conditions de test des exercices pour les corrections

**Ruby 2.5.1**

**Bundle 1.16.1**

## Contributeurs

@bab - Baptiste Rogeon

... et un bisou à @Massimo et @bfraikin !
