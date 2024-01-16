# Game Battle Simulation

Fight Game is battle  game that involves players, a knight, a wizard, and an enemy. The game is designed with a turn-based system where players take turns attacking the enemy, and the enemy counterattacks if it is still alive.

## Technologies Used

- **Java Servlets**: The backend of the game is implemented using Java Servlets to handle server-side logic.

- **JSP (JavaServer Pages)**: JSP is employed to create dynamic web pages, enhancing the user interface of the game.

- **Bootstrap**: The game's frontend is designed using Bootstrap to ensure a responsive and visually appealing user interface.

- **JavaScript (JS)**: JS is utilized for client-side scripting, enabling interactive features within the game.

- **CSS (Cascading Style Sheets)*

## Features

- **Players**: The game features a knight and a wizard, each with their own set of attributes such as name, health points (pv), and attack capabilities.

- **Enemy**: An enemy with its own set of attributes, including name, health points, and loot drop (in this case, a POTION).

- **Turn-based System**: The game utilizes a turn-based system where each player takes a turn to attack the enemy, and the enemy counterattacks if still alive.

- **Outcome**: The game determines the outcome based on whether all players or the enemy are alive at the end of the simulation.

## How to Use

1. **Player Initialization**: The `Traitement` class initializes a knight, a wizard, and an enemy. Players are stored in a list.

2. **Main Simulation Loop**: The main method contains a simulation loop where players take turns attacking the enemy until either all players or the enemy are defeated.

3. **Outcome Display**: The game displays the final state of the enemy and the players . The outcome message will indicate whether the players or the enemy emerged victorious.

