Jour 3-5 - Rails
=========================

Création d'un blog.

Programme des 3 jours
---------------------

Durant cette 2e partie de la semaine, nous allons travailler sur
Rails. Le nombre de features (merveilleuse) et la puissance
(extraordinaire) de ce framework sont telles que nous n'aurons
pas, hélas, le temps d'en aborder toute la richesse, ni celui
d'explorer tous les facettes de sa communauté. Nous allons néanmoins
pouvoir aborder les fondements de rails et vous fournir les outils
continuer à investiguer par vous même.

1 - Setup l'environnement avec docker
----------------------------

    First of all, créez vous des alias pour accélérer vos manipulations en console (conseillé) :

    Dans Windows, dans le terminal : https://www.it-connect.fr/creer-des-alias-persistants-en-powershell/

    Dans linux et mac, modifiez vos .bashrc (ou .zshrc si vous utilisez zsh) :

    alias dcb="docker-compose build"
    alias dcu="docker-compose up"
    alias dcd="docker-compose down"
    alias dcx="docker-compose exec"
    alias dcrr="docker-compose restart"
    alias :dcps="docker-compose ps"

    alias dvp="docker volume prune"
    alias dvls="docker volume ls"

Vous pourrez directement faire : `dcx [server_name] [command]`, ici le docker rails s'appelle 'server'.

    dcx server rails db:create
    dcx server rails console
    dcx server rspec
    ...

    git clone https://github.com/thibpoullain/rails-course
    docker-compose build
    docker-compose up

Et... tadaa ! Vous avez une application Rails qui tourne aux cotés d'une base de donnée PostgreSQL !

Dans un autre terminal, laissant le premier tourner avec les logs des serveurs, vous pouvez piloter votre serveur rails de cette façon :

    docker-compose exec server bundle exec [command]

avec les alias c'est plus rapide :

    dcx server bundle exec [command]

Pour mettre à jour les dépendances (gemfile) simplement redémarrer le server :

    docker-compose restart server

avec les alias :

    dcrr server


2 - Création des posts (ensemble)
----------------------------

- Utiliser le générateur "scaffold" pour générer les posts

Ces derniers devront avoir les attributs suivants : titre (string), description (text), publié (boolean),  publié le (datetime)

- Appliquer les migrations à la base de donnée

- Ajouter des seeds

- Ajouter Bootstrap (https://github.com/twbs/bootstrap-rubygem) n'oubliez pas de redémarrer le server.

- Modifier le fichier app/views/posts/index.html.erb comme suit :

```
<h4 class='d-flex justify-content-between'>
  <span>Post</span>
   [mettre ici un link_to vers l'url de création de post, avec la class 'btn btn-primary']
</h4>

[boucle sur les posts]
 [link_to vers l'édition du post avec un block qui contient le code suivant]
    <div class='card mb-3'>
      <div class='card-body mb-1'>
        <h5 class='card-title text-dark'>
        [afficher le titre du post]
        </h5>
        <p class='text-secondary mb-0'>
         [afficher la description du post]
         </p>
      </div>
    </div>
```

- Modifiez le layout application comme suit :

```
 <body class='bg-light'>
    <div class="container">
      <p class="notice"><%= notice %></p>
      <p class="alert"><%= alert %></p>
      <%= yield %>
    <div>
 </body>
```

- Installer la gem simple_fom (avec l'option pour prendre en charge bootstrap)

Profitez en pour homogénéiser toutes les pages (show, edit, index...)


3 - Installation de devise
----------------------------

- Installez la gem bcrypt (déjà présente dans le gemfile, la décommenter)
- Installer la gem devise et installez là en suivant la documentation
    https://github.com/heartcombo/devise#starting-with-rails
- Générez les vues de devise
    https://github.com/heartcombo/devise#configuring-views
- Faire en sorte que les posts affichés ne soit accessibles que par un auteur connecté
Il faudra créer un controlleur Authors, utilise un callback de devise (:authenticate_author!) à l'intérieur, et faire hériter le controlleur post de ce dernier.
- Modifier les vues pour qu'elles correspondent à la relation entre les controlleurs pour respecter la logique de rails (et accéssoirement, que ça marche ;) )
- Créer la reation entre le modèle auteur et le modèle post (https://guides.rubyonrails.org/association_basics.html)
- Générer une migration qui utilise add_reference pour ajouter la clé étrangère

4 - Challenge final ! Les catégories des posts !
------------------------------

L'objectif est de créer des catégories pour les articles du blog, et de pouvoir les afficher sur ce dernier.

Pour cela vous aurez besoin de tout ce que nous avons appris ensemble précédement !

- ajouter un nouvel attribut à post en créant une nouvelle migration

- Faire des validations pour qu'il ne puisse y avoir que certaines catégories de disponibles

- Modifier le controlleur des posts pour qu'il accepte ce nouvel attribut

- Modifier les seeds pour qu'ils créer des catégories pour chaque post

- Modifier la vue des posts pour faire apparaitre les catégories, dans le show, dans l'index, dans l'édit, l'update...

