
## Deploy no fly

Configurando o projeto

```console
fly launch
```

A `imagem docker` precisa já ter os arquivos estáticos. A forma mais simples de ser fazer isso é fazer uma coleta do arquivos `staticos` localmente antes de gerar a imagem.

```console
python manage.py collectstatic --noinput
```

Deploy

```console
fly deploy
```

Para cria o superusuario basta fazer:

```console
fly ssh console -C "python /app/manage.py createsuperuser"
```

Variveis de ambiente não sensiveis foram declaradas no `fly.toml`:

```
[env]
  PORT = "8000"
  DEBUG = true
  ALLOWED_HOSTS = "django-hcca.fly.dev"
```
