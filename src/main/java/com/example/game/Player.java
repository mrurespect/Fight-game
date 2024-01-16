package com.example.game;

public  abstract class Player extends Character{
    private int experience ;

    public Player(String name, int pv) {
        super(name, pv);
        experience=0;
    }

    @Override
    public  void attack(Character character) {
        character.takeDamage(10);
        this.experience+=10;
    }


    public int getExperience() {
        return experience;
    }

    public void setExperience(int experience) {
        this.experience = experience;
    }
}
