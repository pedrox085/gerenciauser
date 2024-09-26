#!/bin/bash

# Função para adicionar usuário
adicionar_usuario() {
    read -p "Digite o nome do usuário a ser adicionado: " usuario
    useradd "$usuario"
    echo "Usuário $usuario adicionado com sucesso."
}

# Função para remover usuário
remover_usuario() {
    read -p "Digite o nome do usuário a ser removido: " usuario
    userdel "$usuario"
    echo "Usuário $usuario removido com sucesso."
}

# Função para alterar a senha do usuário
alterar_senha_usuario() {
    read -p "Digite o nome do usuário para alterar a senha: " usuario
    passwd "$usuario"
}

# Função para alterar o shell do usuário
alterar_shell_usuario() {
    read -p "Digite o nome do usuário: " usuario
    read -p "Digite o novo shell (ex: /bin/bash): " shell
    chsh -s "$shell" "$usuario"
    echo "Shell do usuário $usuario alterado para $shell."
}

# Função para adicionar um grupo
adicionar_grupo() {
    read -p "Digite o nome do grupo a ser adicionado: " grupo
    groupadd "$grupo"
    echo "Grupo $grupo adicionado com sucesso."
}

# Função para remover um grupo
remover_grupo() {
    read -p "Digite o nome do grupo a ser removido: " grupo
    groupdel "$grupo"
    echo "Grupo $grupo removido com sucesso."
}

# Função para adicionar um usuário em um grupo
adicionar_usuario_grupo() {
    read -p "Digite o nome do usuário: " usuario
    read -p "Digite o nome do grupo: " grupo
    usermod -aG "$grupo" "$usuario"
    echo "Usuário $usuario adicionado ao grupo $grupo."
}

# Função para alterar o grupo principal de um usuário
alterar_grupo_principal_usuario() {
    read -p "Digite o nome do usuário: " usuario
    read -p "Digite o nome do novo grupo principal: " grupo
    usermod -g "$grupo" "$usuario"
    echo "Grupo principal do usuário $usuario alterado para $grupo."
}

# Função para verificar a qual grupo um usuário pertence
verificar_grupos_usuario() {
    read -p "Digite o nome do usuário: " usuario
    groups "$usuario"
}

# Função para adicionar 'n' usuários
adicionar_n_usuarios() {
    read -p "Digite o nome base dos usuários (ex: funcionario): " base
    read -p "Quantos usuários deseja adicionar? " n
    for (( i=1; i<=n; i++ )); do
        useradd "${base}${i}"
        echo "Usuário ${base}${i} adicionado."
    done
}

# Função para exibir o menu
mostrar_menu() {
    echo "Gerência de Usuários e Grupos"
    echo "1 – Adicionar Usuário"
    echo "2 – Remover Usuário"
    echo "3 – Alterar a senha do usuário"
    echo "4 – Alterar o shell do usuário"
    echo "5 – Adicionar grupo"
    echo "6 – Remover grupo"
    echo "7 – Adicionar um usuário em um grupo"
    echo "8 – Alterar o grupo principal de um usuário"
    echo "9 – Verificar qual grupo um usuário pertence"
    echo "10 – Adicionar 'n' usuários"
    echo "11 – Sair"
}

# Loop principal do script
while true; do
    mostrar_menu
    read -p "Escolha uma opção: " opcao
    case $opcao in
        1) adicionar_usuario ;;
        2) remover_usuario ;;
        3) alterar_senha_usuario ;;
        4) alterar_shell_usuario ;;
        5) adicionar_grupo ;;
        6) remover_grupo ;;
        7) adicionar_usuario_grupo ;;
        8) alterar_grupo_principal_usuario ;;
        9) verificar_grupos_usuario ;;
        10) adicionar_n_usuarios ;;
        11) echo "Saindo..."; exit 0 ;;
        *) echo "Opção inválida! Tente novamente." ;;
    esac
done
