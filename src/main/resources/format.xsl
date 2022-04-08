<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:dat="http://www.gkv-datenaustausch.de/xml-schema/EEBZ0-DAT/1.3"
	xmlns:anw="http://www.gkv-datenaustausch.de/XMLSchema/EEBZ0-ANW/1.3">
	<xsl:template match="/">
		<html xmlns="http://www.w3.org/1999/xhtml" lang="de">
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
				<title>ANW</title>
				<style>
					svg {
						font-family: Arial;
						stroke: #231f20;
						stroke-width: 0.282916;
					}

					rect {
						fill: none;
					}

					.feld_titel {
						stroke: none;
						font-size: 6px;
					}

					.feld_inhalt {
						font-size: 12px;
						line-height: 1.5;
						font-family: "Courier New";
						stroke: none;
					}

					.trenner {
						stroke-width: 1;
					}

					.linie {
						stroke: #e9e9e9;
						stroke-width: 1;
					}

					.kreuz {
						stroke: black;
						stroke-width: 2.5;
					}

					.ueberschrift {
						font-weight: bold;
						font-size: 9px;
						stroke: none;
					}

					.kleiner {
						font-size: 10px;
					}

					.titel {
						font-size: 20px;
						font-weight: bold;
					}

					.tabelle {
						text-align: center;
						line-height: 0.92;
						border-collapse: collapse;
						width: 720;
					}

					.tabelle td:last-child {
						text-align: left;
					}

					.tabelle td {
						border-bottom: 1px solid #e9e9e9;
						border-right: 1px solid #e9e9e9;
						padding-left: 3px;
					}

					.tabelle td:last-child {
						border-right: none;
					}

					.summe tr:nth-last-child(2) td {
						border-bottom: 0.15em solid #231f20;
					}

					.summe tr:last-child td {
						border-bottom: none;
						padding-top: 5px;
					}
				</style>
			</head>
			<body>
				<svg width="793.7" height="1111.51" viewBox="0 0 793.7 1111.51">
					<rect x="0" y="0" width="793.7" height="1111.5" style="fill: none; stroke:#000000;"></rect>

					<text x="500" y="100" class="titel">Antwortdaten</text>
					<text x="500" y="130" class="titel">(ANW)</text>

					<!-- Obere Box-->
					<g id="obere_box">
						<rect x="34" y="20" width="302" height="177"/>
						<text x="37" y="27" class="feld_titel">Antragsnummer / Mitteilungsnummer</text>
						<text x="37" y="45" class="feld_inhalt">
							<xsl:value-of select="dat:Nutzdaten/dat:Antwort/anw:Antragsnummer_Mitteilungsnummer"/>
						</text>
						<line x1="34" y1="55" x2="336" y2="55"/>
						<text x="37" y="62" class="feld_titel">Verarbeitungskennzeichen</text>
						<foreignObject x="37" y="57" width="302" height="302">
							<p class="feld_inhalt" style="line-height: 1.25">
								<xsl:choose>
									<xsl:when test="dat:Nutzdaten/dat:Antwort/anw:Verarbeitungskennzeichen = '10'">
										erstmalige Übermittlung
									</xsl:when>
									<xsl:when test="dat:Nutzdaten/dat:Antwort/anw:Verarbeitungskennzeichen = '22'">
										Beendigung einer Genehmigung durch die Krankenkasse wegen Änderung des Antrags durch den Zahnarzt
									</xsl:when>
									<xsl:when test="dat:Nutzdaten/dat:Antwort/anw:Verarbeitungskennzeichen = '23'">
										Beendigung einer Genehmigung durch die Krankenkasse wegen Behandlerwechsel (keine weitere Behandlung)
									</xsl:when>
									<xsl:when test="dat:Nutzdaten/dat:Antwort/anw:Verarbeitungskennzeichen = '24'">
										Änderung der Genehmigung durch die Krankenkasse wegen nachträglicher Änderung der Bonusstufe/Härtefall (ZE)
									</xsl:when>
									<xsl:when test="dat:Nutzdaten/dat:Antwort/anw:Verarbeitungskennzeichen = '25'">
										Änderung der Genehmigung durch die Krankenkasse wegen nachträglicher Änderung der Zuschusshöhe (KFO)
									</xsl:when>
									<xsl:when test="dat:Nutzdaten/dat:Antwort/anw:Verarbeitungskennzeichen = '26'">
										Beendigung einer Genehmigung durch die Krankenkasse wegen Ende des Leistungsanspruchs
									</xsl:when>
								</xsl:choose>
							</p>
						</foreignObject>
						<line x1="34" y1="120" x2="336" y2="120"/>
						<text x="37" y="127" class="feld_titel">Antwortkennzeichen:</text>

						<!--Ankreuzboxen-->
						<rect x="40" y="140" width="20" height="20" />
						<text x="70" y="155" class="feld_inhalt">Genehmigt</text>
						<rect x="150" y="140" width="20" height="20" />
						<text x="180" y="155" class="feld_inhalt">nicht genehmigt</text>

						<!--Kreuze-->
						<xsl:choose>
							<xsl:when test="dat:Nutzdaten/dat:Antwort/anw:Antwortkennzeichen= '0'">
								<line x1="150" y1="160" x2="170" y2="140" class="kreuz" />
								<line x1="150" y1="140" x2="170" y2="160" class="kreuz" />
							</xsl:when>
							<xsl:otherwise>
								<line x1="40" y1="160" x2="60" y2="140" class="kreuz" />
								<line x1="40" y1="140" x2="60" y2="160" class="kreuz" />
							</xsl:otherwise>
						</xsl:choose>

						<line x1="34" y1="168" x2="336" y2="168" />
						<text x="37" y="175" class="feld_titel">Datum der Entscheidung</text>
						<text x="37" y="190" class="feld_inhalt">
							<xsl:call-template name="formatDate">
								<xsl:with-param name="date" select="dat:Nutzdaten/dat:Antwort/anw:Datum_der_Entscheidung"/>
								<xsl:with-param name="jahr_zweistellig" select="false()"/>
							</xsl:call-template>
						</text>
						<line x1="120" y1="185" x2="120" y2="197" />

						<text x="130" y="175" class="feld_titel">Endedatum</text>
						<text x="130" y="190" class="feld_inhalt">
							<xsl:if test="dat:Nutzdaten/dat:Antwort/anw:Endedatum">
								<xsl:call-template name="formatDate">
									<xsl:with-param name="date" select="dat:Nutzdaten/dat:Antwort/anw:Endedatum"/>
									<xsl:with-param name="jahr_zweistellig" select="false()"/>
								</xsl:call-template>
							</xsl:if>
						</text>
					</g>
					<!-- Begründungen -->
					<xsl:if test="dat:Nutzdaten/dat:Antwort/anw:Begruendungen">
						<svg x="57" y="220">
							<line x1="0" y1="0" x2="720" y2="0" class="trenner" />
							<svg>
								 <text y="10" class="ueberschrift">Begründungen:</text>
								<foreignObject y="20" width="720" height="300">
									<table class="tabelle feld_inhalt kleiner">
										<xsl:for-each select="dat:Nutzdaten/dat:Antwort/anw:Begruendungen/anw:Begruendung">																														<!--<xsl:value-of select="."/>-->
											<tr>
												<td>- 
													<xsl:choose>
														<xsl:when test=". = '01'">nicht richtlinienkonform</xsl:when>
														<xsl:when test=". = '02'">fehlende Versicherung</xsl:when>
														<xsl:when test=". = '03'">gutachterlich befürwortet</xsl:when>
														<xsl:when test=". = '04'">gutachterlich nicht befürwortet</xsl:when>
														<xsl:when test=". = '05'">gutachterlich teilweise befürwortet</xsl:when>
														<xsl:when test=". = '06'">Taschentiefen unzureichend (PAR)</xsl:when>
														<xsl:when test=". = '07'">Implantatversorgung (PAR)</xsl:when>
														<xsl:when test=". = '08'">letzte Behandlung jünger als 2 Jahre (PAR)</xsl:when>
														<xsl:when test=". = '09'">keine Verwendung</xsl:when>
														<xsl:when test=". = '10'">Zahnersatz innerhalb der Gewährleistung</xsl:when>
														<xsl:when test=". = '11'">Arbeitsunfall/Berufskrankheit (anderer Kostenträger)</xsl:when>
														<xsl:when test=". = '12'">Antrag auf Wunsch des Versicherten zurückgezogen</xsl:when>
														<xsl:when test=". = '13'">Sonstiges, siehe Erläuterung</xsl:when>
														<xsl:when test=". = '14'">Aktualisierung des bisher noch nicht genehmigten Antrags von derselben Praxis</xsl:when>
													</xsl:choose>
												</td>
											</tr>
										</xsl:for-each>
									</table>
								</foreignObject>
							</svg>
							<svg y="70">
								<text y="8" class="ueberschrift">Erläuterungen:</text>
								<line y1="30" x2="720" y2="30" class="linie" />
								<line y1="45" x2="720" y2="45" class="linie" />
								<line y1="60" x2="720" y2="60" class="linie" />
								<foreignObject y="8" width="720" height="300">
									<p class="feld_inhalt kleiner">
										<xsl:value-of select="dat:Nutzdaten/dat:Antwort/anw:Begruendungen/anw:Erlaeuterung"/>
									</p>
								</foreignObject>
							</svg>
						</svg>
					</xsl:if>

					<!--Angaben zur Bewilligung von Zahnersatz-->
					<xsl:if test="dat:Nutzdaten/dat:Antwort/anw:Angaben_zur_Bewilligung_von_Zahnersatz">
						<svg x="57" y="220">
							<line x1="0" y1="0" x2="720" y2="0" class="trenner" />
							<svg>
								<text y="10" class="ueberschrift">Angaben zur Bewilligung von Zahnersatz:</text>
								<text y="23" class="feld_inhalt kleiner">
									<xsl:choose>
										<xsl:when test="dat:Nutzdaten/dat:Antwort/anw:Angaben_zur_Bewilligung_von_Zahnersatz/anw:Zuschusshoehe = '0'">60% / unbekannt
										</xsl:when>
										<xsl:when test="dat:Nutzdaten/dat:Antwort/anw:Angaben_zur_Bewilligung_von_Zahnersatz/anw:Zuschusshoehe = '1'">70% / fünf Jahre durchgehend
										</xsl:when>
										<xsl:when test="dat:Nutzdaten/dat:Antwort/anw:Angaben_zur_Bewilligung_von_Zahnersatz/anw:Zuschusshoehe = '2'">75% / zehn Jahre durchgehend
										</xsl:when>
										<xsl:when test="dat:Nutzdaten/dat:Antwort/anw:Angaben_zur_Bewilligung_von_Zahnersatz/anw:Zuschusshoehe = '3'">100% / (nur für Antwortdatensatz)
										</xsl:when>
									</xsl:choose>
								</text>
							
						        <!--Ankreuzboxen-->
								<text x="500" y="20" class="ueberschrift">Härtefall</text>
								<rect x="550" y="10" width="15" height="15" />
								<text x="575" y="20" class="feld_inhalt kleiner">ja</text>
								<rect x="625" y="10" width="15" height="15" />
								<text x="650" y="20" class="feld_inhalt kleiner">nein</text>

								<xsl:choose>
									<xsl:when test="dat:Nutzdaten/dat:Antwort/anw:Angaben_zur_Bewilligung_von_Zahnersatz/anw:Haertefall = '1'">
										<line x1="550" y1="10" x2="565" y2="25" class="kreuz" />
										<line x1="550" y1="25" x2="565" y2="10" class="kreuz" />
									</xsl:when>
									<xsl:otherwise>
										<line x1="625" y1="10" x2="640" y2="25" class="kreuz" />
										<line x1="625" y1="25" x2="640" y2="10" class="kreuz" />
									</xsl:otherwise>
								</xsl:choose>

								<!--Tabelle-->
								<foreignObject x="0" y="35" width="720" height="1000">
									<table class="feld_inhalt tabelle summe">
										<tr class="kleiner">
              								<td width="100">Befundsnummer</td>
         									<td width="32">Anz.</td>
       								    	<td>Festzuschussbetrag</td>
       								    </tr>
										<xsl:for-each select="dat:Nutzdaten/dat:Antwort/anw:Angaben_zur_Bewilligung_von_Zahnersatz/anw:Festzuschuesse/anw:Befund_fuer_Festzuschuss">
											<tr>
												<td><xsl:value-of select="anw:Befundnummer"/></td>
												<td><xsl:value-of select="anw:Anzahl"/></td>
												<td><xsl:value-of select="anw:Festzuschussbetrag"/>€</td>
											</tr>
										</xsl:for-each>
										<tr>
											<td colspan="2" class="kleiner">Summe Zuschussbeträge</td>
											<td style="font-weight: bold;">13961,45€</td>
										</tr>
									</table>
								</foreignObject>
							</svg>
						</svg>
					</xsl:if>

					<!--Angaben zur Bewilligung von KFO-->
					<xsl:if test="dat:Nutzdaten/dat:Antwort/anw:Angaben_zur_Bewilligung_von_KFO">
						<svg x="57" y="220">
							<line x1="0" y1="0" x2="720" y2="0" class="trenner" />
							<svg>
								<text y="10" class="ueberschrift">Angaben zur Bewilligung von KFO:</text>
								<line y1="30" x2="720" y2="30" class="linie" />
								<line y1="45" x2="720" y2="45" class="linie" />
								<line y1="60" x2="720" y2="60" class="linie" />

								<text y="27" class="feld_inhalt kleiner">Zuschuss KFO: 
									<xsl:value-of select="dat:Nutzdaten/dat:Antwort/anw:Angaben_zur_Bewilligung_von_KFO/anw:Zuschuss_KFO"/>%
								</text>
								<text y="42" class="feld_inhalt kleiner">Anspruchsbeginn:
									<xsl:call-template name="formatQuarter">
										<xsl:with-param name="date" select="dat:Nutzdaten/dat:Antwort/anw:Angaben_zur_Bewilligung_von_KFO/anw:Anspruchsbeginn"/>
										<xsl:with-param name="jahr_zweistellig" select="false()"/>
									</xsl:call-template>
								</text>
							</svg>
						</svg>
					</xsl:if>
				</svg>
			</body>
		</html>
	</xsl:template>
	<!--Template, um JJJJMMTT zu formatieren  -->
	<xsl:template name="formatDate">
		<xsl:param name="date"/>
		<xsl:param name="jahr_zweistellig" select="false()"/>
		<!-- optionaler Parameter; default "false", d. h. 4-stellige Jahreszahl -->
		<xsl:variable name="jahr_laenge">
			<xsl:if test="$jahr_zweistellig">
				<xsl:value-of select="2"/>
			</xsl:if>
			<xsl:if test="not($jahr_zweistellig)">
				<xsl:value-of select="4"/>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="jahr_start">
			<xsl:if test="$jahr_zweistellig">
				<xsl:value-of select="3"/>
			</xsl:if>
			<xsl:if test="not($jahr_zweistellig)">
				<xsl:value-of select="1"/>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="yearNum" select="substring ($date, $jahr_start, $jahr_laenge)"/>
		<xsl:variable name="monthNum" select="substring ($date, 5, 2)"/>
		<xsl:variable name="dayNum" select="substring ($date, 7, 2)"/>
		<xsl:value-of select="$dayNum"/>
		<xsl:text>.</xsl:text>
		<xsl:value-of select="$monthNum"/>
		<xsl:text>.</xsl:text>
		<xsl:value-of select="$yearNum"/>
	</xsl:template>

	<!--Template, um JJJJ-Q zu formatieren  -->
	<xsl:template name="formatQuarter">
		<xsl:param name="date"/>
		<xsl:param name="jahr_zweistellig" select="false()"/>
		<!-- optionaler Parameter; default "false", d. h. 4-stellige Jahreszahl -->
		<xsl:variable name="jahr_laenge">
			<xsl:if test="$jahr_zweistellig">
				<xsl:value-of select="2"/>
			</xsl:if>
			<xsl:if test="not($jahr_zweistellig)">
				<xsl:value-of select="4"/>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="jahr_start">
			<xsl:if test="$jahr_zweistellig">
				<xsl:value-of select="3"/>
			</xsl:if>
			<xsl:if test="not($jahr_zweistellig)">
				<xsl:value-of select="1"/>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="yearNum" select="substring ($date, $jahr_start, $jahr_laenge)"/>
		<xsl:variable name="quarterNum" select="substring ($date, 6, 1)"/>
		<xsl:value-of select="$quarterNum"/>
		<xsl:text>. Quatal </xsl:text>
		<xsl:value-of select="$yearNum"/>
	</xsl:template>
</xsl:stylesheet>
