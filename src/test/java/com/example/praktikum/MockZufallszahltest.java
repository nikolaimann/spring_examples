package com.example.praktikum;

import com.example.praktikum.zufallsspiel.ZufallsGenerator;
import com.example.praktikum.zufallsspiel.Zufallsspiel;
import com.example.praktikum.zufallsspiel.ZufallszahlGenerator;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

public class MockZufallszahltest {

    ZufallszahlGenerator mock = Mockito.mock(ZufallszahlGenerator.class);

    MockZufallszahltest() {
        Mockito.when( mock.zufallsZahl() ).thenReturn(5);
    }

    @Test
    public void baueZufallszahl() {
        Zufallsspiel zufallsspiel = new Zufallsspiel(mock);
        zufallsspiel.setZufallszahl(5);
        Assertions.assertEquals("Super, du hast die gesuchte Zahl gefunden", zufallsspiel.getErgebnis(), "Fehler");
        Assertions.assertEquals(1, zufallsspiel.getVersuche());
    }

    @Test
    public void groessereZahl() {
        Zufallsspiel zufallsspiel = new Zufallsspiel(mock);
        zufallsspiel.setZufallszahl(6);
        Assertions.assertEquals("Die gesuchte Zahl ist kleiner", zufallsspiel.getErgebnis(), "Fehler");
        Assertions.assertEquals(1, zufallsspiel.getVersuche());
    }

    @Test
    public void kleinereZahl() {
        Zufallsspiel zufallsspiel = new Zufallsspiel(mock);
        zufallsspiel.setZufallszahl(4);
        Assertions.assertEquals("Die gesuchte Zahl ist größer", zufallsspiel.getErgebnis(), "Fehler");
        Assertions.assertEquals(1, zufallsspiel.getVersuche());
    }
}
