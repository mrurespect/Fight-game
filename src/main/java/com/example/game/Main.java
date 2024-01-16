package com.example.game;

import java.util.*;

public class Main {
    public static boolean hasPlayerAlive(List<Player> players){
        for (Player player:players) {
            if (player.isAlive())return true;
        }
        return false;
    }
    public static class Traitement{
        static Knight knight =new Knight("Knight",100);
        static Wizard wizard =new Wizard("wizard",190,100);
        static Enemy enemy = new Enemy("enemy",500,Loot.POTION);
        static List<Player> personList = new ArrayList<>(Arrays.asList(knight, wizard));
        static Player getPlayer(){
            for (Player player:personList)if (player.isAlive())return player;
            return null;
        }

    }
    public static void main(String[] args){
        var personList =new ArrayList<Player>();
        Knight knight =new Knight("Knight",100);
        Wizard wizard =new Wizard("wizard",190,100);
        Enemy enemy = new Enemy("enemy",500,Loot.POTION);
        personList.add(knight);
        personList.add(wizard);
        forbreak:
        while (hasPlayerAlive(personList)){
            for (Player player:personList){
                while (player.isAlive()){   //if
                    System.out.println("----------------"+player.getName()+" turn ----------------");
                    System.out.println(player.getName() +" attack ");
                    player.attack(enemy);
                    System.out.println(enemy.getName() +" pv :"+enemy.getPv());
                    if (enemy.isAlive()){
                        System.out.println(enemy.getName() +" attack ");
                        enemy.attack(player);
                        System.out.println(player.getName() +" pv :"+player.getPv());
                        if (!player.isAlive())System.out.println(player.getName() +" died");
                    }
                    else {
                        System.out.println("Enemy died !");
                        System.out.println("Players Win !");
                        //System.exit(1);
                        break forbreak;
                    }
                }
            }
        }
        if (!hasPlayerAlive(personList))System.out.println("Enemy Win");

        System.out.println(" \n\n --ETATs-- ");
        System.out.println(enemy);
        Collections.sort(personList);
        for (Player player:personList) {
            System.out.println(player);

        }
        
    }

}
