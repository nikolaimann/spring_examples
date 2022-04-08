package com.example.praktikum.zufallsspiel;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import java.util.logging.Logger;

@Controller
public class ZufallsspielController {

    private Logger log = Logger.getLogger(this.getClass().getName());

    @GetMapping("/zufallsspiel")
    public String zufallsspielForm(Model model) {
        model.addAttribute("zufallsspiel", new Zufallsspiel(new ZufallszahlGenerator()));
        log.info("GetMapping");
        return "zufallsspiel/zufallsspiel";
    }

    @PostMapping("/zufallsspiel")
    public String zufallsspielSubmit(@ModelAttribute Zufallsspiel zufallsspiel, Model model) {
        model.addAttribute("zufallsspiel", zufallsspiel);
        log.info("PostMapping");
        return "zufallsspiel/ergebnis";
    }

    @GetMapping("/zufallsspielneu")
    public String zufallsspielNeu(@ModelAttribute Zufallsspiel zufallsspiel, Model model) {
        zufallsspiel.neueZufallszahl();
        model.addAttribute("zufallsspiel", zufallsspiel);
        log.info("Zufallszahl des Computers = " + zufallsspiel.getZufallszahl_computer());
        return "zufallsspiel/zufallsspiel";
    }
}
