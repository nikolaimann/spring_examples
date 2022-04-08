package com.example.praktikum.zufallsspiel;

public class Zufallsspiel {

    ZufallsGenerator zufallsGenerator;

    public Zufallsspiel(ZufallsGenerator zufallsGenerator) {
        this.zufallsGenerator = zufallsGenerator;
        neueZufallszahl();
    }

    private int zufallszahl;
    private int zufallszahl_computer;
    private int versuche = 0;

    public int getVersuche() {
        return versuche;
    }

    public void setZufallszahl(int zufallszahl) {
        this.zufallszahl = zufallszahl;
    }

    public int getZufallszahl() {
        return zufallszahl;
    }

    public int getZufallszahl_computer() {
        return zufallszahl_computer;
    }

    public void neueZufallszahl() {
        zufallszahl_computer = zufallsGenerator.zufallsZahl();
        versuche = 0;
    }

    public String getErgebnis() {
        versuche++;
        if (zufallszahl == zufallszahl_computer) {
            return "Super, du hast die gesuchte Zahl gefunden";
        } else if (zufallszahl < zufallszahl_computer) {
            return "Die gesuchte Zahl ist größer";
        } else {
            return "Die gesuchte Zahl ist kleiner";
        }
    }
}
