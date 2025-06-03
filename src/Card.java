public class Card {
    // Atributos
    private String suit; // Palo: tréboles, corazones, picas, diamantes
    private String color; // Color: rojo o negro
    private String value; // Valor: 2-10, A, J, Q, K

    // Constructor
    public Card(String suit, String value) {
        this.suit = suit;
        this.value = value;
        // Determinar el color según el palo
        if (suit.equals("corazones") || suit.equals("diamantes")) {
            this.color = "rojo";
        } else {
            this.color = "negro";
        }
    }

    // Getters
    public String getSuit() {
        return suit;
    }

    public String getColor() {
        return color;
    }

    public String getValue() {
        return value;
    }

    // Método para representar la carta como cadena
    @Override
    public String toString() {
        return suit + "," + color + "," + value;
    }
}