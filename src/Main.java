public class Main {
    public static void main(String[] args) {
        // Crear una nueva baraja
        Deck deck = new Deck();

        // Mostrar la cantidad inicial de cartas
        System.out.println("Baraja creada con " + deck.getCards().size() + " cartas");

        // Mezclar la baraja
        deck.shuffle();

        // Obtener la primera carta
        System.out.println("\nObtener la primera carta:");
        deck.head();

        // Obtener una carta al azar
        System.out.println("\nObtener una carta al azar:");
        deck.randomCard();

        // Repartir una mano de 5 cartas
        System.out.println("\nRepartir una mano de 5 cartas:");
        deck.hand();
    }
}