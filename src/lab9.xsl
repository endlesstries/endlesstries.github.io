<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
   <table border="1" style="text-align:center">
   <thead style="background-color:aqua">
    <tr>
    <td>Тип</td>
    <td>Имя</td>
    <td>Вес</td>
    <td>Ингридиенты</td>
    <td>Способ приготовления</td>
    <td>Каллорийность</td>
    </tr>
    </thead>
     <xsl:for-each select="cookbook/book">
     <tr>
       <td><xsl:value-of select="type"/></td>
       <td><xsl:value-of select="name"/></td>
       <td><xsl:value-of select="weight"/></td>
       <td>
        <table border="1">
        <xsl:for-each select="/cookbook/book/ingredients/ingredient">
            <xsl:sort select="@name"/>
            <xsl:if test="@quantity &lt; 2000">
            <tr>
              <td>
                <xsl:value-of select="@name"/>
              </td>
              <td>
                <xsl:value-of select="@quantity"/>
              </td>
            </tr>
            </xsl:if>
            </xsl:for-each>
          </table>
       </td>
       <td>
        <table border="1"> 
        <xsl:for-each select="/cookbook/book/method/step">
            <tr>
              <td>
                <xsl:value-of select="."/>
              </td>
            </tr>
            </xsl:for-each>
          </table>
       </td>
       <td><xsl:value-of select="caloriesAmount"/></td>
     </tr>
     </xsl:for-each>
   </table>
</xsl:template>
</xsl:stylesheet> 