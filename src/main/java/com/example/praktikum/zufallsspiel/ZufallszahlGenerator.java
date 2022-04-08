package com.example.praktikum.zufallsspiel;

public class ZufallszahlGenerator implements ZufallsGenerator{

    @Override
    public int zufallsZahl() {
        return  (int) (Math.random() * 100 + 1);
    }
}
