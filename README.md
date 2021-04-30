Jour 2-5 - Rails
=========================

Ce repository contient les specs de la majeure partie de la semaine

Programme des 4 jours
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

    git clone https://github.com/thibpoullain/rails-course
    docker-compose build
    docker-compose up

Et... tadaa ! Vous avez une application Rails qui tourne avec sa base de donnée :)

Dans un autre terminal, laissant le premier tourner avec les logs des serveurs, vous pouvez piloter votre serveur rails de cette façon :

    docker-compose exec rails bundle exec [command]

Essayez avec la commande suivante : `rails db:migrate:status`

Tip : créer des alias dans vos .bashrc .zshrc :

    alias dcu=docker-compose up
    alias dcd=docker-compose down
    alias dcx=docker-compose exec
    alias dcrr=docker-compose restart

Vous pourrez directement faire : `dcx [command]`

    dcx rails db:create
    dcx rails console
    dcx rspec
    ...

Pour mettre à jour les dépendances (gemfile) simplement redémarrer le server :

    dcrr server
