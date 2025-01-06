package com.example.superm;

import Entity.Utilisateur;

public class UserNow {
    private static int role=0; // 1 pour admin 2 pour user et 0 non connecte
    public static Utilisateur user = new Utilisateur("","","","");

    public static int getRole() {
        return role;
    }

    public static Utilisateur getUser() {
        return user;
    }

    public static void setUser(Utilisateur user) {
        UserNow.user = user;
    }

    public static void setRole(int role) {
        UserNow.role = role;
    }
}
