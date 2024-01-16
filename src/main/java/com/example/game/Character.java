package com.example.game;

public abstract class Character implements Comparable<Character> {
    @Override
    public int compareTo(Character other) {
        return Integer.compare(other.getPv(),this.getPv());
    }

    private String name ;
    private int pv ;
    public Character(String name, int pv) {
        this.name = name;
        if (pv<0){
            throw new IllegalStateException("pv is less than 0");
        }else this.pv = pv;
    }

    public boolean isAlive(){
        return !(pv ==0);
    }
    public void takeDamage(int amount){
        pv-=amount ;
    }
    public abstract void attack(Character character);

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPv(int pv) {
        this.pv = pv;
    }



    public int getPv() {
        return pv;
    }



    @Override
    public String toString() {
        return "Character{" +
                "name='" + name + '\'' +
                ", pv=" + pv +
                '}';
    }
}
