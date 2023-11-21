#!/bin/bash

# Definimos un array con las opciones del menú. Cada opción es una cadena con dos partes separadas por el carácter '|': el nombre de la opción y el comando correspondiente.
opciones=(
    "Iniciar Git:|git init"
    "Cambiar Nombre de Rama Master a Main:|git branch -m main"
    "Ver Estado de Git:|git status"
    "Añadir Archivo al Área de Trabajo:|read -p 'Ingrese el nombre del archivo: ' archivo && git add $archivo"
    "Añadir Todos los Archivos al Área de Trabajo:|git add ."
    "Realizar Commit:|read -p 'Ingrese el mensaje del commit: ' mensaje && git commit -m \"$mensaje\""
    "Ver Fotografía del Commit:|git log"
    "Creación de un Segundo Archivo (hellogit2.py):|echo -e \"print(\\\"Hello Git2\\\")\" > hellogit2.py"
    "Añadir el Segundo Archivo al Área de Trabajo:|git add hellogit2.py"
    "Ver los Commits:|git log"
    "Realizar Cambios en los Dos Archivos:|git status"
    "Ver Cambios en un Archivo:|read -p 'Ingrese el nombre del archivo: ' archivo && git diff $archivo"
    "Volver al Estado Anterior de un Archivo:|read -p 'Ingrese el nombre del archivo: ' archivo && git checkout $archivo"
    "Ir a un Commit Anterior:|read -p 'Ingrese el hash del commit: ' commit && git checkout $commit"
    "Volver al Último Commit:|git checkout HEAD"
    "Crear Alias (ejemplo con 'tree'):|read -p 'Ingrese el nombre del alias: ' alias_name && git config --global alias.$alias_name 'log --graph --decorate --all --oneline'"
    "Ver con el Alias Creado:|read -p 'Ingrese el nombre del alias: ' alias_name && git $alias_name"
    "Crear Archivo .gitignore y Añadirlo:|echo '.gitignore' > .gitignore && git add .gitignore && git commit -m 'Añadir archivo .gitignore'"
    "Ver Cambios en un Archivo (ejemplo con hellogit.py):|read -p 'Ingrese el nombre del archivo: ' archivo && git diff $archivo"
    "Volver al Segundo Commit con 'git reset --hard':|read -p 'Ingrese el hash del commit: ' commit && git reset --hard $commit"
    "Ver Log Completo (Reflog):|git reflog"
    "Crear un Tag (Ejemplo con 'clase_1'):|read -p 'Ingrese el nombre del tag: ' tag && git tag $tag"
    "Crear Tercer Archivo (hellogit3.py) en Main:|echo -e \"print(\\\"Hello Git3\\\")\" > hellogit3.py && git add . && git commit -m 'Git 3 v2'"
    "Crear Tercer Archivo (login.py) en Nueva Rama ('login'):|git branch login && git switch login && echo -e \"print(\\\"Login functionality\\\")\" > login.py && git add . && git commit -m 'Mensaje login'"
    "Merge de Rama 'login' en Rama 'main':|git switch main && git merge login"
    "Crear Nuevo Commit en Rama 'login' y en Rama 'main':|git switch login && echo -e \"print(\\\"Hello Git3 - Login\\\")\" > hellogit3.py && git add . && git commit -m 'Git 3 login' && git switch main && git add . && git commit -m 'Git 3 v3'"
    "Conflicto al Hacer Merge en Rama 'login':|git switch login && git merge main"
    "Realizar Stash de Cambios en Rama 'login':|git stash"
    "Listar Stashes:|git stash list"
    "Cambiar de Rama (login a main) con Stash:|git switch main && git stash apply"
    "Eliminar Stash Después de Aplicar:|git stash drop"
    "Crear un Branch (Rama) y Cambiar a Ella:|read -p 'Ingrese el nombre de la nueva rama: ' nueva_rama && git branch $nueva_rama && git switch $nueva_rama"
    "Eliminar una Rama:|read -p 'Ingrese el nombre de la rama a eliminar: ' rama_eliminar && git branch -d $rama_eliminar"
    "Eliminar una Rama Forzadamente:|read -p 'Ingrese el nombre de la rama a eliminar (forzado): ' rama_eliminar_forzado && git branch -D $rama_eliminar_forzado"
    "Cambiar el Último Commit:|git commit --amend"
    "Modificar el Mensaje del Último Commit:|read -p 'Ingrese el nuevo mensaje del commit: ' nuevo_mensaje && git commit --amend -m \"$nuevo_mensaje\""
    "Revertir un Commit:|read -p 'Ingrese el hash del commit a revertir: ' commit_revertir && git revert $commit_revertir"
    "Resetear un Commit (Soft, Mixed, Hard):|read -p 'Seleccione el tipo de reset (soft, mixed, hard): ' tipo_reset && case $tipo_reset in soft) git reset --soft HEAD~1 ;; mixed) git reset --mixed HEAD~1 ;; hard) git reset --hard HEAD~1 ;; *) echo 'Tipo de reset no válido' ;; esac"
    "Eliminar Archivos del Árbol de Trabajo y del Repositorio:|read -p 'Ingrese el nombre del archivo a eliminar: ' archivo_eliminar && git rm $archivo_eliminar && git commit -m 'Eliminar $archivo_eliminar'"
    "Mostrar Log con Diferencias Entre Dos Ramas:|read -p 'Ingrese el nombre de la primera rama: ' rama1 && read -p 'Ingrese el nombre de la segunda rama: ' rama2 && git log $rama1..$rama2"
    "Mostrar Diferencias Entre Dos Ramas:|read -p 'Ingrese el nombre de la primera rama: ' rama1_diff && read -p 'Ingrese el nombre de la segunda rama: ' rama2_diff && git diff $rama1_diff..$rama2_diff"
    "Salir:|exit 0"
)

while true; do
    clear
    echo "=== Menú Git ==="
    for ((i=0; i<${#opciones[@]}; i++)); do
        echo "$i. ${opciones[i]%%:*}" # Imprimimos el índice y el nombre de la opción (sin el comando).
    done
    echo "==============================="
    read -p "Ingrese el número de la operación que desea realizar: " opcion

    if [[ $opcion =~ ^[0-9]+$ ]] && [ "$opcion" -ge 0 ] && [ "$opcion" -lt ${#opciones[@]} ]; then
        seleccion="${opciones[$opcion]#*|}" # Obtenemos el comando correspondiente a la opción seleccionada.
        eval "$seleccion" # Ejecutamos el comando.
        read -p "Presione Enter para continuar..."
    else
        echo "Opción inválida. Presione Enter para continuar..."
        read -p "Presione Enter para"
    fi
done
