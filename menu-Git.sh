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
    echo "8. Creación de un Segundo Archivo (hellogit2.py)"
    echo "9. Añadir el Segundo Archivo al Área de Trabajo"
    echo "10. Ver los Commits"
    echo "11. Realizar Cambios en los Dos Archivos"
    echo "12. Ver Cambios en un Archivo"
    echo "13. Volver al Estado Anterior de un Archivo"
    echo "14. Ir a un Commit Anterior"
    echo "15. Volver al Último Commit"
    echo "16. Crear Alias (ejemplo con 'tree')"
    echo "17. Ver con el Alias Creado"
    echo "18. Crear Archivo .gitignore y Añadirlo"
    echo "19. Ver Cambios en un Archivo (ejemplo con hellogit.py)"
    echo "20. Volver al Segundo Commit con 'git reset --hard'"
    echo "21. Ver Log Completo (Reflog)"
    echo "22. Crear un Tag (Ejemplo con 'clase_1')"
    echo "23. Crear Tercer Archivo (hellogit3.py) en Main"
    echo "24. Crear Tercer Archivo (login.py) en Nueva Rama ('login')"
    echo "25. Merge de Rama 'login' en Rama 'main'"
    echo "26. Crear Nuevo Commit en Rama 'login' y en Rama 'main'"
    echo "27. Conflicto al Hacer Merge en Rama 'login'"
    echo "28. Realizar Stash de Cambios en Rama 'login'"
    echo "29. Listar Stashes"
    echo "30. Cambiar de Rama (login a main) con Stash"
    echo "31. Eliminar Stash Después de Aplicar"
    echo "32. Crear un Branch (Rama) y Cambiar a Ella"
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
        2) git branch -m main ;;
        3) git status ;;
        4) git add hellogit.py ;;
        5) git add . ;;
        6) git commit -m "Este es el primer commit" ;;
        7) git log ;;
        8) echo -e "print(\"Hello Git2\")" > hellogit2.py ;;
        9) git add hellogit2.py ;;
        10) git log ;;
        11) git status ;;
        12) git diff hellogit.py ;;
        13) git checkout hellogit.py ;;
        14) git checkout ec7d703a95377bc0f40cde6f1415cf3cae63af1a ;;
        15) git checkout HEAD ;;
        16) git config --global alias.tree "log --graph --decorate --all --oneline" ;;
        17) git tree ;;
        18) echo ".gitignore" > .gitignore
            git add .gitignore
            git commit -m "Añadir archivo .gitignore" ;;
        19) git diff hellogit.py ;;
        20) git reset --hard 96a320a ;;
        21) git reflog ;;
        22) git tag clase_1 ;;
        23) echo -e "print(\"Hello Git3\")" > hellogit3.py
            git add .
            git commit -m "Git 3 v2" ;;
        24) git branch login
            git switch login  # o git checkout login (dependiendo de la versión de Git)
            echo -e "print(\"Login functionality\")" > login.py
            git add .
            git commit -m "Mensaje login" ;;
        25) git switch main
            git merge login ;;
        26) git switch login
            echo -e "print(\"Hello Git3 - Login\")" > hellogit3.py
            git add .
            git commit -m "Git 3 login"
            git switch main
            git add .
            git commit -m "Git 3 v3" ;;
        27) git switch login
            git merge main ;;
        28) git stash ;;
        29) git stash list ;;
        30) git switch main
            git stash apply ;;
        31) git stash drop ;;
        32) git branch nueva_rama
            git switch nueva_rama ;;
        33) git branch -d nueva_rama ;;
        34) git branch -D rama_a_eliminar ;;
        35) git commit --amend ;;
        36) git commit --amend -m "Nuevo mensaje del commit" ;;
        37) git revert <hash_del_commit> ;;
        38) # Dependiendo de la opción del usuario, elige entre soft, mixed, o hard
            read -p "Seleccione el tipo de reset (soft, mixed, hard): " tipo_reset
            case $tipo_reset in
                soft) git reset --soft HEAD~1 ;;
                mixed) git reset --mixed HEAD~1 ;;
                hard) git reset --hard HEAD~1 ;;
                *) echo "Tipo de reset no válido" ;;
            esac ;;
        39) git rm archivo_a_eliminar
            git commit -m "Eliminar archivo_a_eliminar" ;;
        40) git log rama1..rama2 ;;
        41) git diff rama1..rama2 ;;
        42) echo "Saliendo del menú Git. ¡Hasta luego!"
            break ;;
        *) echo "Opción no válida. Inténtelo de nuevo." ;;
    esac
done
