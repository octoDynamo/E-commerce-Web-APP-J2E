package com.example.superm;

import java.util.ArrayList;
import java.util.List;
import Entity.Commande;
public class Command{
    private static List <Commande> commandes = new ArrayList<>();
    public static void add(Commande cmd){
        commandes.add(cmd);
    }
    public static List <Commande> get(){
        return Command.commandes;
    }
    public static void delete(Commande cmd){
        commandes.remove(cmd);
    }
}
