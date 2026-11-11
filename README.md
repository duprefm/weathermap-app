# PHP Weathermap Manual, offline

Application conteneurisée servant la copie locale du manuel de PHP Weathermap v0.98a
(http://www.network-weathermap.com/manual/), récupérée avant la disparition du site.

## Lancer avec Docker

```bash
docker compose up -d --build
# puis ouvrir http://localhost:8080
```

## Lancer avec Podman

```bash
podman build -t weathermap-manual .
podman run -d --name weathermap-manual -p 8080:8080 weathermap-manual
# puis ouvrir http://localhost:8080
```

Ou avec Podman Compose :

```bash
podman-compose up -d --build
```

## Structure

- `site/` : copie statique du manuel (pages HTML, images, exemple interactif, styles)
- `Dockerfile` : image nginx:1.27-alpine, port 8080
- `nginx.conf` : gzip, cache des images, redirection `/` vers `manual/pages/main.html`

## Notes

- Aucune dépendance réseau : tout est servi depuis le conteneur.
- Les liens internes entre pages fonctionnent hors ligne.
- Bootstrap 3 est servi localement (le site d'origine renvoyait une 404 pour ce fichier).
