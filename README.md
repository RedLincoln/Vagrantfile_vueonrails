# Un Vagrantfile para Ruby on Rails(RoR) y Vue.js 
Este `Vagrantfile` crea una máquina virtual (MV) para VirtualBox (VB) instalando

- Ruby Versión Manager (RVM)
- La versión de Ruby  2.5.3
- Docker Community Edition (Docker CE )
- PostgreSQL:9.6 a través de la imagen oficial de PostgresSQL en Docker Hub.
- Yarn 1.2.1
- Node.js 12.x

La idea es realizar la edición en local con un editor a la carta y ejecutar en
la MV. La MV comparte el directorio de trabajo de la máquina anfitrión `/path/to/directory` con el directorio de la MV `/vagrant`.


## Descarga del repositorio

Todo empieza con obtener el fichero `Vagrantfile`
```
$ git clone https://github.com/RedLincoln/Vagrantfile_vueonrails.git
$ cd Vagrantfile_vueonrails
```

Continúa con levantar la máquina y provisionarla

```
$ vagrant up # Puede tardar varios minutos
```

## Gemset

Existe el gemset `app_gemset` el cual tiene:

1. Rails 5.2.1
2. webpacker 3.5

Puede ser util para crear un nuevo proyecto `Rails`.

## ¿Y para trabajar?

1. Establecer la redirección de puertos desde la máquina anfitrión a la MV para poder utilizar el navegador desde la máquina anfitrión.
```
$ vagrant ssh -- -L 3000:localhost:3000
vagrant@...:~$
```

2. Si ya se tiene un proyecto Rails solo seria necesario ir a al directorio donde este e instalar las `gems`

```
vagrant@...:~$ cd /vagrant/PROJECT_NAME
vagrant@...:~$ bundle install
```


 Otra forma es crear en `/vagrant` el proyecto utilizando el siguiente comando.

```
vagrant@...:~$ cd /vagrant
vagrant@...:~$ rvm gemset use app_gemset
vagrant@...:~$ rails new first_app --webpack=vue --database=postgresql
vagrant@...:~$ cd first_app
```

3. PostreSQL fue instalado con usuario "postgres' y password "password".
Una opción es cambiar el fichero de configuración de base de datos `config/database.yml` para la configuración
de *development* y *test*. Cuidado con las indentaciones del fichero `.yml`
```
host: localhost
username: postgres
password: password
```

4. Asegurate de estar en el `gemset` correcto (app_gemset si no se ha creado otro).

```
vagrant@...:~$ rvm gemset list
vagrant@...:~$ rvm gemset use app_gemset # cambia gemset si es necesario
```

5. Comprueba la aplicación
lanzando el servidor *RoR* en la MV y accede desde la máquina anfitrión
```
vagrant@...:~$ rails db:create
vagrant@...:~$ rails server
$  curl http://localhost:3000
```

Una ves realizado estos pasos se puede acceder a la página web en el navegador de preferencia con la URL: http://localhost:3000