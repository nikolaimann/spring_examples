package com.example.praktikum.xslt;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

public class TransformWithXslt {

    public static void main(String[] args) throws TransformerException {

        var xmlSource = new StreamSource(TransformWithXslt.class.getResourceAsStream("/forms.xml"));
        var xsltSource = new StreamSource(TransformWithXslt.class.getResourceAsStream("/format_test.xslt"));

        TransformerFactory transformerFactory = TransformerFactory.newInstance();

        // add XSLT in Transformer
        Transformer transformer = transformerFactory.newTransformer(xsltSource);

        transformer.transform(xmlSource, new StreamResult(System.out));
    }

}
