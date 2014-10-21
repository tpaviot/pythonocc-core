Introduction
============

pythonocc-core est une surcouche python à la bibliothèque C++
OpenCascade Community Edition (OCE).

pythonocc est un noyau CAO 3D (Conception Assistée par Ordinateur) : vous pouvez créer des géométries/topologies, selon la représentation Boundary Representation(BRep),
qui décrivent les formes d'objets mécaniques qu'il est possible de fabriquer sur des
machines automatisées à commande numérique.

Avant toute chose, la lecture de ce document suppose que vous ayez
correctement installé/configuré pythonocc dans sa version 0.16.0. Vous devez donc
préalablement vérifier que cette installation s'est bien passée.

Depuis un prompt python (par exemple ipytohn), taper la séquence d'instructions
suivante ::

  In [1]: import OCC
  In [2]: OCC.VERSION
  Out[2]: '0.16.0-dev'

Une erreur à cet instant signifie que l'installation n'est pas correcte. Reportez-vous
à la section installation pour résoudre le problème.

A propos de ce document
-----------------------

Ce document propose un bref aperçu des fonctionnalités de pythonocc. Le périmètre fonctionnel
de pythonocc est très étendu, ce document ne couvre qu'une petite partie de ce
qu'il est possible de faire.

L'objectif de ce document est de permettre au lecteur une prise en main de la bibliothèque
pour permettre une découverte approfondie en autonomie.

Dans les sections qui suivent, on présente, en les expliquant, les différents exemples qui
sont disponibles dans le dossier /examples. L'étude, et a fortiori la modification, de ces
exemples doivent permettre une prise en main progressive qui balaie l'ensemble des
domaines suivants : la modélisation géométrique, l'exploration de la topologie,
l'exécution d'algorithmes complexes (opérations booléennes, fonctions de balayage etc.),
l'export vers d'autres logiciels par l'intermédiaire de formats de fichiers standardisés.

A chaque section est associée un fichier d'exemple qu'il est possible d'exécuter pour
examiner le résultat produit.
