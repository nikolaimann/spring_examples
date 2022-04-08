package com.example.praktikum;

import com.example.praktikum.zufallsspiel.ZufallsGenerator;
import com.example.praktikum.zufallsspiel.Zufallsspiel;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class Zufallszahltest {

    class TestZufallszahlGenerator implements ZufallsGenerator {
        @Override
        public int zufallsZahl() {
            return 5;
        }

    }

    @Test
    public void baueZufallszahl() {
        Zufallsspiel zufallsspiel = new Zufallsspiel(new TestZufallszahlGenerator());
        zufallsspiel.setZufallszahl(5);
        Assertions.assertEquals("Super, du hast die gesuchte Zahl gefunden", zufallsspiel.getErgebnis(), "Fehler");
        Assertions.assertEquals(1, zufallsspiel.getVersuche());
    }

    @Test
    public void groessereZahl() {
        Zufallsspiel zufallsspiel = new Zufallsspiel(new TestZufallszahlGenerator());
        zufallsspiel.setZufallszahl(6);
        Assertions.assertEquals("Die gesuchte Zahl ist kleiner", zufallsspiel.getErgebnis(), "Fehler");
        Assertions.assertEquals(1, zufallsspiel.getVersuche());
    }

    @Test
    public void kleinereZahl() {
        Zufallsspiel zufallsspiel = new Zufallsspiel(new TestZufallszahlGenerator());
        zufallsspiel.setZufallszahl(4);
        Assertions.assertEquals("Die gesuchte Zahl ist größer", zufallsspiel.getErgebnis(), "Fehler");
        Assertions.assertEquals(1, zufallsspiel.getVersuche());
    }
}
