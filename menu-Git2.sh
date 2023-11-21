#!/bin/bash

while true; do
    # Mostrar el menú
    echo "=== Menú Git ==="
    echo "1. Iniciar Git"
    echo "2. Cambiar Nombre de Rama Master a Main"
    echo "3. Ver Estado de Git"
    echo "4. Añadir Archivo al Área de Trabajo"
    echo "5. Añadir Todos los Archivos al Área de Trabajo"
    echo "6. Realizar Commit"
    echo "7. Ver Fotografía del Commit"
    echo "8. Creación de un Nuevo Archivo"
    echo "9. Añadir el Nuevo Archivo al Área de Trabajo"
    echo "10. Ver los Commits"
    echo "11. Realizar Cambios en los Archivos"
    echo "12. Ver Cambios en un Archivo"
    echo "13. Volver al Estado Anterior de un Archivo"
    echo "14. Ir a un Commit Anterior"
    echo "15. Volver al Último Commit"
    echo "16. Crear Alias"
    echo "17. Ver con el Alias Creado"
    echo "18. Crear Archivo .gitignore y Añadirlo"
    echo "19. Ver Cambios en un Archivo"
    echo "20. Volver a un Commit Específico"
    echo "21. Ver Log Completo (Reflog)"
    echo "22. Crear un Tag"
    echo "23. Crear Nuevo Archivo en Main"
    echo "24. Crear Nuevo Archivo en Nueva Rama"
    echo "25. Merge de Rama en Main"
    echo "26. Crear Nuevo Commit en Todas las Ramas"
    echo "27. Conflicto al Hacer Merge en Rama"
    echo "28. Realizar Stash de Cambios"
    echo "29. Listar Stashes"
    echo "30. Cambiar de Rama con Stash"
    echo "31. Eliminar Stash Después de Aplicar"
    echo "32. Crear un Branch y Cambiar a Ella"
    echo "33. Eliminar una Rama"
    echo "34. Eliminar una Rama Forzadamente"
    echo "35. Cambiar el Último Commit"
    echo "36. Modificar el Mensaje del Último Commit"
    echo "37. Revertir un Commit"
    echo "38. Resetear un Commit (Soft, Mixed, Hard)"
    echo "39. Eliminar Archivos del Árbol de Trabajo y del Repositorio"
    echo "40. Mostrar Log con Diferencias Entre Dos Ramas"
    echo "41. Mostrar Diferencias Entre Dos Ramas"
    echo "42. Salir"

    # Solicitar la elección del usuario
    read -p "Ingrese el número de la operación que desea realizar: " opcion

    # Evaluar la elección y ejecutar la operación correspondiente
    case $opcion in
        1) git init ;;
        2) read -p "Ingrese el nuevo nombre para la rama principal: " nuevo_nombre
           git branch -m $nuevo_nombre ;;
        3) git status ;;
        4) read -p "Ingrese el nombre del archivo a añadir al área de trabajo: " archivo
           git add $archivo ;;
        5) git add . ;;
        6) read -p "Ingrese el mensaje del commit: " mensaje_commit
           git commit -m "$mensaje_commit" ;;
        7) git log ;;
        8) read -p "Ingrese el nombre del nuevo archivo: " nuevo_archivo
           echo -e "print(\"Contenido del nuevo archivo\")" > $nuevo_archivo ;;
        9) read -p "Ingrese el nombre del nuevo archivo a añadir al área de trabajo: " nuevo_archivo
           git add $nuevo_archivo ;;
        10) git log ;;
        11) git status ;;
        12) read -p "Ingrese el nombre del archivo para ver los cambios: " archivo_cambios
            git diff $archivo_cambios ;;
        13) read -p "Ingrese el nombre del archivo para volver al estado anterior: " archivo_anterior
            git checkout $archivo_anterior ;;
        14) read -p "Ingrese el hash del commit al que desea ir: " hash_commit
            git checkout $hash_commit ;;
        15) git checkout HEAD ;;
        16) read -p "Ingrese el nombre para el alias: " nombre_alias
            read -p "Ingrese el comando para el alias: " comando_alias
            git config --global alias.$nombre_alias "$comando_alias" ;;
        17) read -p "Ingrese el nombre del alias a ejecutar: " alias_ejecutar
            git $alias_ejecutar ;;
        18) echo ".gitignore" > .gitignore
            git add .gitignore
            git commit -m "Añadir archivo .gitignore" ;;
        19) read -p "Ingrese el nombre del archivo para ver los cambios: " archivo_cambios
            git diff $archivo_cambios ;;
        20) read -p "Ingrese el hash del commit al que desea volver: " hash_volver
            git reset --hard $hash_volver ;;
        21) git reflog ;;
        22) read -p "Ingrese el nombre para el nuevo tag: " nombre_tag
            git tag $nombre_tag ;;
        23) read -p "Ingrese el nombre para el nuevo archivo en Main: " nuevo_archivo_main
            echo -e "print(\"Contenido del nuevo archivo en Main\")" > $nuevo_archivo_main
            git add .
            git commit -m "Añadir nuevo archivo en Main" ;;
        24) read -p "Ingrese el nombre para el nuevo archivo en la nueva rama: " nuevo_archivo_rama
            git branch nueva_rama
            git switch nueva_rama
            echo -e "print(\"Contenido del nuevo archivo en la nueva rama\")" > $nuevo_archivo_rama
            git add .
            git commit -m "Añadir nuevo archivo en la nueva rama" ;;
        25) git switch main
            git merge nueva_rama ;;
        26) git switch nueva_rama
            echo -e "print(\"Contenido del nuevo archivo en todas las ramas\")" > nuevo_archivo_todas_ramas
            git add .
            git commit -m "Añadir nuevo archivo en todas las ramas"
            git switch main
            git add .
            git commit -m "Añadir nuevo archivo en todas las ramas" ;;
        27) git switch nueva_rama
            echo -e "print(\"Contenido modificado en la nueva rama\")" > archivo_modificado_nueva_rama
            git add .
            git commit -m "Modificar archivo en nueva rama"
            git switch main
            echo -e "print(\"Contenido modificado en Main\")" > archivo_modificado_main
            git add .
            git commit -m "Modificar archivo en Main"
            git switch nueva_rama
            git merge main ;;
        28) git stash ;;
        29) git stash list ;;
        30) git switch main
            git stash apply ;;
        31) git stash drop ;;
        32) read -p "Ingrese el nombre para la nueva rama: " nueva_rama
            git branch $nueva_rama
            git switch $nueva_rama ;;
        33) read -p "Ingrese el nombre de la rama a eliminar: " rama_eliminar
            git branch -d $rama_eliminar ;;
        34) read -p "Ingrese el nombre de la rama a eliminar forzadamente: " rama_eliminar_forzadamente
            git branch -D $rama_eliminar_forzadamente ;;
        35) git commit --amend ;;
        36) read -p "Ingrese el nuevo mensaje para el último commit: " nuevo_mensaje_commit
            git commit --amend -m "$nuevo_mensaje_commit" ;;
        37) read -p "Ingrese el hash del commit a revertir: " hash_revertir
            git revert $hash_revertir ;;
        38) # Dependiendo de la opción del usuario, elige entre soft, mixed, o hard
            read -p "Seleccione el tipo de reset (soft, mixed, hard): " tipo_reset
            case $tipo_reset in
                soft) git reset --soft HEAD~1 ;;
                mixed) git reset --mixed HEAD~1 ;;
                hard) git reset --hard HEAD~1 ;;
                *) echo "Tipo de reset no válido" ;;
            esac ;;
        39) read -p "Ingrese el nombre del archivo a eliminar: " archivo_eliminar
            git rm $archivo_eliminar
            git commit -m "Eliminar $archivo_eliminar" ;;
        40) read -p "Ingrese el nombre de la primera rama: " rama1
            read -p "Ingrese el nombre de la segunda rama: " rama2
            git log $rama1..$rama2 ;;
        41) read -p "Ingrese el nombre de la primera rama: " rama1_diff
            read -p "Ingrese el nombre de la segunda rama: " rama2_diff
            git diff $rama1_diff..$rama2_diff ;;
        42) echo "Saliendo del menú Git. ¡Hasta luego!"
            break ;;
        *) echo "Opción no válida. Inténtelo de nuevo." ;;
    esac
done
