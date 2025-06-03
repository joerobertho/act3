@echo off
REM Script para crear los archivos del proyecto de la baraja de cartas de poker

REM Definir la ruta donde se crearán los archivos
set projectPath=PokerDeck

REM Crear la carpeta del proyecto si no existe
if not exist "%projectPath%" (
    mkdir "%projectPath%"
)

REM Contenido de los archivos

REM Card.java
(
echo public class Card { ^
    // Atributos ^
    private String suit; // Palo: tréboles, corazones, picas, diamantes ^
    private String color; // Color: rojo o negro ^
    private String value; // Valor: 2-10, A, J, Q, K ^

    // Constructor ^
    public Card(String suit, String value) { ^
        this.suit = suit; ^
        this.value = value; ^
        // Determinar el color según el palo ^
        if (suit.equals("corazones") || suit.equals("diamantes")) { ^
            this.color = "rojo"; ^
        } else { ^
            this.color = "negro"; ^
        } ^
    } ^

    // Getters ^
    public String getSuit() { ^
        return suit; ^
    } ^

    public String getColor() { ^
        return color; ^
    } ^

    public String getValue() { ^
        return value; ^
    } ^

    // Método para representar la carta como cadena ^
    @Override ^
    public String toString() { ^
        return suit + "," + color + "," + value; ^
    } ^
}
) > "%projectPath%\Card.java"

REM Deck.java
(
echo import java.util.ArrayList; ^
import java.util.Collections; ^

public class Deck { ^
    // Atributos (usando Collection Framework) ^
    private ArrayList^<Card^> cards; // Lista de cartas ^
    private ArrayList^<Card^> usedCards; // Cartas usadas (opcional, para seguimiento) ^

    // Constructor ^
    public Deck() { ^
        cards = new ArrayList^<^>(); ^
        usedCards = new ArrayList^<^>(); ^

        // Palos de las cartas ^
        String[] suits = {"tréboles", "corazones", "picas", "diamantes"}; ^
        
        // Valores de las cartas ^
        String[] values = {"2", "3", "4", "5", "6", "7", "8", "9", "10", "A", "J", "Q", "K"}; ^

        // Crear las 52 cartas y agregarlas a la baraja ^
        for (String suit : suits) { ^
            for (String value : values) { ^
                cards.add(new Card(suit, value)); ^
            } ^
        } ^
    } ^

    // Método para mezclar la baraja ^
    public void shuffle() { ^
        Collections.shuffle(cards); ^
        System.out.println("Baraja mezclada"); ^
    } ^

    // Método para obtener la primera carta ^
    public void head() { ^
        if (cards.isEmpty()) { ^
            System.out.println("La baraja está vacía"); ^
            return; ^
        } ^
        
        Card topCard = cards.remove(0); ^
        System.out.println(topCard); ^
        System.out.println("Quedan " + cards.size() + " cartas"); ^
    } ^

    // Método para obtener una carta al azar ^
    public void randomCard() { ^
        if (cards.isEmpty()) { ^
            System.out.println("La baraja está vacía"); ^
            return; ^
        } ^
        
        int randomIndex = (int) (Math.random() * cards.size()); ^
        Card randomCard = cards.remove(randomIndex); ^
        System.out.println(randomCard); ^
        System.out.println("Quedan " + cards.size() + " cartas"); ^
    } ^

    // Método para repartir una mano de 5 cartas ^
    public void hand() { ^
        if (cards.size() ^< 5) { ^
            System.out.println("No hay suficientes cartas para repartir una mano"); ^
            return; ^
        } ^
        
        System.out.println("----- Mano -----"); ^
        for (int i = 0; i ^< 5; i++) { ^
            Card card = cards.remove(0); ^
            System.out.println(card); ^
        } ^
        System.out.println("Quedan " + cards.size() + " cartas"); ^
    } ^

    // Getter para las cartas (para el Main) ^
    public ArrayList^<Card^> getCards() { ^
        return cards; ^
    } ^
}
) > "%projectPath%\Deck.java"

REM Main.java
(
echo public class Main { ^
    public static void main(String[] args) { ^
        // Crear una nueva baraja ^
        Deck deck = new Deck(); ^
        
        // Mostrar la cantidad inicial de cartas ^
        System.out.println("Baraja creada con " + deck.getCards().size() + " cartas"); ^
        
        // Mezclar la baraja ^
        deck.shuffle(); ^
        
        // Obtener la primera carta ^
        System.out.println(); ^
        System.out.println("Obtener la primera carta:"); ^
        deck.head(); ^
        
        // Obtener una carta al azar ^
        System.out.println(); ^
        System.out.println("Obtener una carta al azar:"); ^
        deck.randomCard(); ^
        
        // Repartir una mano de 5 cartas ^
        System.out.println(); ^
        System.out.println("Repartir una mano de 5 cartas:"); ^
        deck.hand(); ^
    } ^
}
) > "%projectPath%\Main.java"

echo Archivos creados exitosamente en la carpeta: %projectPath%
pause