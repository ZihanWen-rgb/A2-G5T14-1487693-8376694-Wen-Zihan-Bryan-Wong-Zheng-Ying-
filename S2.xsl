<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/forecast">

<html>
<head>
    <title>Weather Forecast</title>
    <style>
        h1 { 
            style="text-align:left; 
            margin-left:20px;
        }

        table {
            style="text-align:left; 
            margin-left:20px;
            border-collapse: collapse;
        }

        th {
            border: 1px solid black;
            width: 100px;
            height: 40px;
            text-align: center;
            vertical-align: middle;
            background-color: yellow;
            font-weight: bold;
        }

        td {
            border: 1px solid black;
            width: 100px;
            height: 100px;
            text-align: center;
            vertical-align: middle;
            padding:5px;
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

<h1>
    <xsl:value-of select="@queryLocation"/>
    [
    <xsl:value-of select="@queryTime"/>
    ]
</h1>

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
                <xsl:choose>
                    <xsl:when test="month = 1">Jan</xsl:when>
                    <xsl:when test="month = 2">Feb</xsl:when>
                    <xsl:when test="month = 3">Mar</xsl:when>
                    <xsl:when test="month = 4">Apr</xsl:when>
                    <xsl:when test="month = 5">May</xsl:when>
                    <xsl:when test="month = 6">Jun</xsl:when>
                    <xsl:when test="month = 7">Jul</xsl:when>
                    <xsl:when test="month = 8">Aug</xsl:when>
                    <xsl:when test="month = 9">Sep</xsl:when>
                    <xsl:when test="month = 10">Oct</xsl:when>
                    <xsl:when test="month = 11">Nov</xsl:when>
                    <xsl:when test="month = 12">Dec</xsl:when>
                </xsl:choose>
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
                <xsl:text>images/</xsl:text>
                <xsl:value-of select="overallCode"/>
                <xsl:text>.jpeg</xsl:text>
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