package com.example.game;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "Start", value = "/Start")
public class Start extends HttpServlet {
    public static boolean hasPlayerAlive(List<Player> players){
        for (Player player:players) {
            if (player.isAlive())return true;
        }
        return false;
    }
    static int i=0 ;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        var player = Main.Traitement.getPlayer();
        Enemy enemy = Main.Traitement.enemy;
        request.setAttribute("player", Main.Traitement.getPlayer());
        request.setAttribute("enemy",enemy);
        ServletContext servletContext=this.getServletContext();
        request.setAttribute("turn","Alpha");
        if (!hasPlayerAlive(Main.Traitement.personList)){
            request.setAttribute("resultat",false);
            request.setAttribute("player", new Wizard("wizard",0,0));
            servletContext.getRequestDispatcher("/WEB-INF/fight.jsp").forward(request, response);
        }
        if (i==0){
            i++;
            servletContext.getRequestDispatcher("/WEB-INF/fight.jsp").forward(request, response);
        }
        else {
                request.setAttribute("turn",player.getName());
                player.attack(Main.Traitement.enemy);
                if (enemy.isAlive()){
                    enemy.attack(player);
                    if (!player.isAlive()){
                        System.out.println(player.getName() +" died");
                    }
                }
                else {
                    System.out.println("Enemy died !");
                    System.out.println("Players Win !");
                    request.setAttribute("resultat",true);
                }
                request.setAttribute("player",player);
                request.setAttribute("enemy",enemy);
                servletContext.getRequestDispatcher("/WEB-INF/fight.jsp").forward(request, response);
        }

    }
}
