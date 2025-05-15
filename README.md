# DogsWalk

Plateforme de mise en relation entre propriétaires de chiens et promeneurs (dogsitter). Nous nous intéressons ici aux fondamentaux des `models` et des `migrations`.

## Prérequis

- Ruby 3.x
- Rails 7.x
- SQLite3
- Bundler

## Installation

1. Clone ce dépôt :

   ```bash
   git clone <repo-url>
   cd DogsWalk
   ```

2. Installe les dépendances :

   ```bash
   bundle install
   ```

3. Crée et initialise la base de données :

   ```bash
   bin/rails db:setup
   ```

   ou

   ```bash
   bin/rails db:create db:migrate db:seed
   ```

## Utilisation

- Pour lancer le serveur :

  ```bash
  bin/rails server
  ```

- Pour ouvrir la console Rails :

  ```bash
  bin/rails console
  ```

## Structure des modèles

- **City** : contient plusieurs dogsitters et chiens (attribut : `city_name`)
- **Dogsitter** : appartient à une ville, peut promener plusieurs chiens via les strolls
- **Dog** : appartient à une ville, peut être promené par plusieurs dogsitters via les strolls
- **Stroll** : relie un dogsitter et un chien (many-to-many)

## Génération de données de test

- Les seeds utilisent la gem `faker` pour générer des villes, dogsitters, chiens et promenades aléatoires.

- Pour régénérer les données :

  ```bash
  bin/rails db:seed
  ```

## Exemples de requêtes en console

- Voir tous les dogsitters d'une ville :

  ```ruby
  City.first.dogsitters
  ```

- Voir tous les chiens promenés par un dogsitter :

  ```ruby
  Dogsitter.first.dogs
  ```

- Voir toutes les promenades d'un dogsitter :

  ```ruby
  Dogsitter.first.strolls
  ```

## Tests

- Pour lancer les tests :

  ```bash
  bin/rails test
  ```

---
## Auteurs
- [THIAM](https://github.com/thaliou)
- [ASSY](https://github.com/AssyaJalo)
- [SOUARE](https://github.com/bbkouty)
- [FANAR](https://github.com/fanarbandia)
- [MAIGA](https://github.com/Fadelion)

## Licence

Ce projet est sous licence MIT. Consultez le fichier [LICENSE](LICENSE) pour plus de détails.

---

Développé dans le cadre d'un projet d'apprentissage de la programmation web avec Ruby on Rails.
