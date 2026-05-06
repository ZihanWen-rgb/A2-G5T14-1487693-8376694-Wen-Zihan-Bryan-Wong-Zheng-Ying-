<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/forecast">

<html>
<head>
    <title>Weather Forecast</title>
    <style>
        table {
            border-collapse: collapse;
            margin: auto;
        }

        th, td {
            border: 1px solid black;
            width: 100px;
            height: 100px;
            text-align: center;
            vertical-align: middle;
        }

        th {
            background-color: yellow;
            font-weight: bold;
        }

        .dateCell {
            background-color: yellow;
            font-weight: bold;
        }

        img {
            width: 40px;
            height: 40px;
        }
    </style>
</head>

<body>

<h2 style="text-align:center;">
    <xsl:value-of select="@queryLocation"/>
    [
    <xsl:value-of select="@queryTime"/>
    ]
</h2>

<table>
    <tr>
        <th>Date</th>
        <th>Mon</th>
        <th>Tue</th>
        <th>Wed</th>
        <th>Thu</th>
        <th>Fri</th>
        <th>Sat</th>
        <th>Sun</th>
    </tr>

    <xsl:for-each select="weather">
        <xsl:sort select="@yyyymmdd" data-type="number" order="descending"/>

        <tr>
            <td class="dateCell">
                <xsl:value-of select="date"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="month"/>
            </td>

            <td>
                <xsl:if test="dayOfWeek='Mon'">
                    <xsl:call-template name="weatherInfo"/>
                </xsl:if>
            </td>

            <td>
                <xsl:if test="dayOfWeek='Tues'">
                    <xsl:call-template name="weatherInfo"/>
                </xsl:if>
            </td>

            <td>
                <xsl:if test="dayOfWeek='Wed'">
                    <xsl:call-template name="weatherInfo"/>
                </xsl:if>
            </td>

            <td>
                <xsl:if test="dayOfWeek='Thur'">
                    <xsl:call-template name="weatherInfo"/>
                </xsl:if>
            </td>

            <td>
                <xsl:if test="dayOfWeek='Fri'">
                    <xsl:call-template name="weatherInfo"/>
                </xsl:if>
            </td>

            <td>
                <xsl:if test="dayOfWeek='Sat'">
                    <xsl:call-template name="weatherInfo"/>
                </xsl:if>
            </td>

            <td>
                <xsl:if test="dayOfWeek='Sun'">
                    <xsl:call-template name="weatherInfo"/>
                </xsl:if>
            </td>
        </tr>
    </xsl:for-each>
</table>

</body>
</html>

</xsl:template>

<xsl:template name="weatherInfo">
    <div>
        <xsl:value-of select="highest"/>
        <xsl:text>° - </xsl:text>
        <xsl:value-of select="lowest"/>
        <xsl:text>°</xsl:text>
    </div>

    <div>
        <img>
            <xsl:attribute name="src">
                <xsl:value-of select="overallCode"/>
                <xsl:text>.png</xsl:text>
            </xsl:attribute>
        </img>
    </div>

    <div>
        <xsl:attribute name="style">
            <xsl:text>color:</xsl:text>
            <xsl:choose>
                <xsl:when test="overallCode='cloudy'">blue</xsl:when>
                <xsl:when test="overallCode='thunderstorm'">orange</xsl:when>
                <xsl:when test="overallCode='rain'">lime</xsl:when>
                <xsl:otherwise>red</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>

        <xsl:value-of select="overall"/>
    </div>
</xsl:template>

</xsl:stylesheet>