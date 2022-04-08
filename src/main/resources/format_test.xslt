<html xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

        <body style="font-size:12pt;background-color:#EEEEEE">
            <h1 style="font-size:20pt;color:#FF0000">Hello World DOM + XML + XSLT</h1>
            <xsl:for-each select="List/item">
                <ul>
                    <li>
                        <xsl:value-of select="id"/> -
                        <xsl:value-of select="content"/> -
                        <xsl:value-of select="title"/>
                    </li>
                </ul>
            </xsl:for-each>
        </body>
</html>