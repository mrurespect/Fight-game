<%@ page import="com.example.game.Player" %>
<%@ page import="com.example.game.Wizard" %>
<%@ page import="com.example.game.Enemy" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="css/all.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style>
        #main{
            background-image: url("images/img.gif");
            background-position: center 95%;
            background-size: cover;
            background-repeat: no-repeat;
            overflow: hidden;
        }
        .tableau{
            width: 200px;
            height: 100px;
            top: 10%;
            border-radius: 6px;
            overflow: hidden;
        }
        .player1-tab{
            left: 5%;
        }
        .player2-tab{
            right: 5%;
        }
        .degat{
            position: absolute;
            background-color: red;
            color: black;

            width: 80px;
            border-radius: 6px ;
            text-align: center;
        }
        .degat1{
            top: 70%;
        }
        .degat2{
            top: 70%;
        }
        .resulat{
            background-color: rgba(0,0,0,0.75);
        }
        .player-img{
            top: 80%;
        }
        #ennemi{
            transform: rotateY(180deg);
        }
    </style>
</head>
<body>
<%
    Player player = (Player) request.getAttribute("player");
    Enemy enemy=(Enemy) request.getAttribute("enemy");
    String name =(String)request.getAttribute("turn");
%>
<div id="main" class="vh-100 position-relative">
    <h1 class="text-center pt-2 pb-4 mb-5 text-danger">Round
            <% if (player.getClass()==Wizard.class){
               out.println(2);
            }else out.println(1);%>
    </h1>
    <h2 class="text-center pt-5 mt-5 text-success  "><span class="text-primary"> <%=name%></span> Turn</h2>
    <div class="tableau player1-tab position-absolute bg-body">
        <p class="text-center bg-danger">
            <%=enemy.getName()%>
        </p>
        <p class="ps-2">pv : <%=enemy.getPv()%></p>
    </div>
    <div class="tableau player2-tab position-absolute bg-body">
        <p class="text-center bg-danger"><%=player.getName()%></p>
        <p class="ps-2 bg-body" >pv :<%=player.getPv()%> </p>
        <p class="ps-2 pb-5" style="line-height: 2px">
           <% if (player.getClass()==Wizard.class){
               Wizard wizard =(Wizard) request.getAttribute("player");
               out.println("magic point : "+wizard.getMp());
           }%>
        </p>
    </div>
    <div class="degat degat1 " style="left: 25%; opacity: 0">
        <p class="m-0 p-0">-10</p>
    </div>
    <div class="degat degat2" style="right: 25%;opacity: 0;">
        <p class="m-0 p-0">-5</p>
    </div>
    <div class="vh-100 w-100 position-absolute top-0 start-0 d-flex justify-content-center align-items-center">
        <div class="resulat <%if (request.getAttribute("resultat")!=null){
            out.println("d-flex");
        }else out.println("d-none");%> text-white  w-75 h-75  justify-content-center align-items-center flex-column">
                <% if (request.getAttribute("resultat")!=null){
                    if ((boolean)request.getAttribute("resultat")){
                        out.println("<h1 >Congratulations</h1><h2>you win</h2>");
                        out.println("<a href=\"index.html\" class=\"btn btn-primary m-3\">main page</a>");

                    }else {
                        out.println("<h1 >Hard Luck</h1><h2>you loose</h2>");
                        out.println("<a href=\"index.html\" class=\"btn btn-primary m-3\">main page</a>");
                    }
                }
                %>
        </div>
    </div>
    <div id="ennemi" class="player-img position-absolute  " style="width: 400px ;left: 20%">
        <img class=" w-100 translate-middle-y" src="images/ennemi1.gif" alt="">
    </div>
    <div id="knight-pos" class="player-img position-absolute  " style="z-index:999;width: 400px ;right: 20%">
        <img  id="knight" class=" w-100 translate-middle-y" src="${pageContext.request.contextPath}/images/girl1.gif" alt="">
    </div>
    <audio  id="ennemi-audio">
        <source src="audio/ennemi.mp3">
    </audio>
    <audio  id="knight-audio">
        <source src="audio/knight.mp3">
    </audio>

</div>
<script src="js/code.jquery.com_jquery-3.7.1.min.js"></script>
<script>
    let image = document.querySelector("#knight");
    let pos = document.querySelector("#knight-pos");
    let ennemi_audio =document.getElementById("ennemi-audio");
    let knight_audio=document.getElementById("knight-audio");

    document.body.addEventListener("click", function (e) {
        change_warrior().then(function () {

            change_ennemi().then(function () {
                window.location.reload();
            });
        });
    });

    async function change_warrior() {
        setTimeout(function () {
        },500)
        let i=0 ;
        let x=setInterval(function () {
            knight_audio.play();
            if (i==3)clearInterval(x);
            i++;
        },1000)
        return new Promise((resolve) => {
            $(image).attr("src", "images/girl.gif");
            $(pos).animate({ right: '+=300px' }, 1000);
            console.log(4);
            setTimeout(function () {
                setInterval(function () {
                    ennemi_audio.play();
                },2000)

                $(".degat1").css({opacity:"1"});
                $(".degat1").animate({top:"-=20%",opacity:"0"},1000);
            },4000)

            setTimeout(function () {
                setInterval(function () {
                    ennemi_audio.play();
                },2000)
                $(image).attr("src", "images/girl1.gif");
                $(pos).animate({ right: '-=300px' }, 1000);

                resolve();
            }, 5000);

        });
    }

    async function change_ennemi() {
        return new Promise((resolve) => {
            $('#ennemi img').attr("src", "images/ennemi.gif");
            $("#ennemi").animate({ left: '+=300px' }, 1000).css({ "z-index": 99999 });
            setTimeout(function () {
                $(".degat2").css({opacity:"1"}).animate({top:"-=20%",opacity:"0"},1000);
            },4000)
            setTimeout(function () {
                console.log(4);
                resolve();
            }, 5000);
        });
    }
</script>
</body>
</html>