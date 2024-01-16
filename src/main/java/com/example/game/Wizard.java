package com.example.game;

public class Wizard extends Player{
    private int mp ;

    public Wizard(String name, int pv, int mp) {
        super(name, pv);
        this.mp = mp;

    }

    @Override
    public void attack(Character character) {
        if (mp>=10){
            mp-=10;
            System.out.println("wizard magic point :"+mp);
            character.takeDamage(10);
        }
    }

    public int getMp() {
        return mp;
    }

    public void setMp(int mp) {
        this.mp = mp;
    }
}
