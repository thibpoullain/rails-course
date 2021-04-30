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

Vous pourrez directement faire : `dcx [command]`

    dcx rails db:create
    dcx rails console
    dcx rspec
    ...


Petits indices pour les intellects qui lisent la consigne jusqu'au bout 😏
----------------------------
Les specs précédés d'un point (.follow_spec.rb, et .hash_tags_spec.rb) sont en option. Si vous souhaitez les faire, supprimez le point qui précède le nom du fichier.
Les features à développer sont dans le dossier "features", les specs de routes "routing" sont là pour vous aiguiller.

Vous remarquerez aussi, que j'ai retiré l'authentification par username.

Pour "Page", on vous demande de retrouver une page à partir de son "slug".
Un slug est un nom au format url, les espaces sont donc remplacés par des "-" .
Exemple : "psg éliminé" devient "psg-elimine".
Nous avons vu que nous pouvions retrouver une entrée en base de données, depuis son id avec NomDuModel.find(objet_id) qui est l'équivalent de NomDuModel.find_by(id: objet_id) . Je vous laisse transposer tout ça avec le slug..

N'oubliez pas que la console est votre amie, à la racine de votre projet, vous pouvez taper la commande suivante :

    host $ rails c

Et tester  :

Page.find(...)
Page.find_by(...)
Page.where(...)

Pour ce qui est des gazooy ou plutôt des gazooies, je vous laisse faire vos recherches sur Ruby On Rails, le pluriel d'une Class, et le fichier "inflections.rb". "Ruby On Rails plural class inflections.rb" sur google devrait faire l'affaire.

Si vous rencontrez des problèmes, vous pouvez me contacter sur Linkedin. Pensez-y, vraiment !
