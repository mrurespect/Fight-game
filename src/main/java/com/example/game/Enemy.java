package com.example.game;

public class Enemy extends Character{

    public Enemy(String name, int pv,Loot loot) {
        super(name, pv);
    }

    @Override
    public void attack(Character character) {
        character.takeDamage(5);
    }

}
