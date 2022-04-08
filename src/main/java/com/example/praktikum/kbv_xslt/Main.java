package com.example.praktikum.kbv_xslt;

import com.example.praktikum.xslt.TransformWithXslt;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;
import java.io.IOException;

public class Main {

    public static void main(String[] args) throws TransformerException, IOException {

        var folder =  new File(TransformWithXslt.class.getResource("/antworten").getFile());
        var transformerFactory = TransformerFactory.newInstance();
        var xsltSource = new StreamSource(TransformWithXslt.class.getResourceAsStream("/format.xsl"));
        var transformer = transformerFactory.newTransformer(xsltSource);

        for (File f: folder.listFiles() ) {
            var resultFile = File.createTempFile(f.getName() + "_transformed_", ".html");
            var fileSource = new StreamSource(f);
            transformWithXslt(fileSource, transformer, resultFile);
            System.out.println(resultFile);
        }

    }

    public static void transformWithXslt(StreamSource xmlSource, Transformer transformer, File output) throws TransformerException {

        var result = new StreamResult(output);
        transformer.transform(xmlSource, result);
    }
}
