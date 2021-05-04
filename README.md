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

1 - Utiliser le générateur "scaffold" pour générer les posts

Ces derniers devront avoir les attributs suivants : titre (string), description (text), publié (boolean),  publié le (datetime), auteur (references)



3 - Installation de devise
----------------------------

1 - Installez la gem bcrypt (déjà présente dans le gemfile, la décommenter)
2 - Installer la gem devise et installez là en suivant la documentation
    https://github.com/heartcombo/devise#starting-with-rails
3 - Générez les vues de devise
    https://github.com/heartcombo/devise#configuring-views
4 - utilisez un générateur pour créer le controller Home avec la méthode index

