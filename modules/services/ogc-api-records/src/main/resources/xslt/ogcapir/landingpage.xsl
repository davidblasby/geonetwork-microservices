<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:gn-ogcapir-util="https://geonetwork-opensource.org/gn-ogcapir-util"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:gmd="http://www.isotc211.org/2005/gmd"
                xmlns:srv="http://www.isotc211.org/2005/srv"
                xmlns:gmx="http://www.isotc211.org/2005/gmx"
                xmlns:gts="http://www.isotc211.org/2005/gts"
                xmlns:gsr="http://www.isotc211.org/2005/gsr"
                xmlns:gco="http://www.isotc211.org/2005/gco"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                exclude-result-prefixes="#all"
                version="3.0">

  <xsl:output method="html"
              media-type="text/html"
              encoding="UTF-8"
              indent="no"/>

  <xsl:import href="classpath:xslt/core/commons/xsl-params-core.xsl"/>
  <xsl:import href="classpath:xslt/core/themes/default/theme.xsl"/>
  <xsl:import href="collection-fn.xsl"/>
  <xsl:import href="html-util.xsl"/>

  <xsl:template match="/">
    <xsl:variable name="collections"
                  select="model/collections/collection"
                  as="node()*"/>

    <xsl:variable name="mainCollection"
                  select="$collections[type = 'portal']"
                  as="node()?"/>
    <xsl:variable name="mainCollectionName"
                  select="gn-ogcapir-util:getCollectionName($mainCollection, $language)"/>

    <xsl:variable name="portals"
                  select="$collections[type = 'subportal']"
                  as="node()*"/>
    <xsl:variable name="harvesters"
                  select="$collections[type = 'harvester']"
                  as="node()*"/>
    <xsl:variable name="outputFormats"
                  select="/model/outputFormats/outputFormat/name"
                  as="node()*"/>

    <xsl:variable name="serviceMetadataInfo"
                  select="parse-xml($mainCollection/serviceRecord)/node()"
                  as="node()*"/>

    <html>

      <xsl:attribute name="lang" select="$language"/>
      <xsl:call-template name="html-head">
        <xsl:with-param name="title" select="$mainCollectionName"/>
      </xsl:call-template>



      <div style="padding-left:20px;height:90px;padding-top:23px;display:flex;flex-direction:row;border:1px solid #CCC; background-color: #EEE">
        <div>
            <svg  style="height:50px" xmlns="http://www.w3.org/2000/svg" id="Layer_2" data-name="Layer 2" viewBox="0 0 1208.15 283.46">
          <defs>
            <style>
              .cls-1 {
              fill: #0d97ce;
              }

              .cls-2 {
              fill: #0f1031;
              }
            </style>
          </defs>
          <g id="All">
            <g id="Logo_Colour" data-name="Logo Colour">
              <g id="Text">
                <g id="CAT">
                  <path id="T" class="cls-1" d="M1130.29,87.44h-49.26v-24.97h127.12v24.97h-49.26V223.19h-28.6V87.44Z"></path>
                  <path id="A" class="cls-1" d="M1013.46,62.47h24.74l69.24,160.72h-32.69l-14.98-36.77h-69.69l-14.53,36.77h-32.01l69.92-160.72Zm36.32,99.43l-24.74-65.38-25.2,65.38h49.94Z"></path>
                  <path id="C" class="cls-1" d="M919.93,100.15c-4.24-5.75-9.76-9.95-16.57-12.6-6.81-2.65-13.47-3.97-19.98-3.97-8.33,0-15.89,1.51-22.7,4.54-6.81,3.03-12.68,7.19-17.59,12.49-4.92,5.3-8.7,11.5-11.35,18.61-2.65,7.12-3.97,14.83-3.97,23.15,0,8.78,1.28,16.8,3.86,24.06,2.57,7.26,6.24,13.51,11.01,18.73,4.77,5.22,10.48,9.27,17.14,12.14,6.66,2.88,14.15,4.31,22.47,4.31s16.27-1.7,22.93-5.11c6.66-3.4,12.03-7.91,16.12-13.51l22.93,16.12c-7.12,8.93-15.82,15.85-26.11,20.77-10.29,4.92-22.32,7.38-36.09,7.38-12.56,0-24.1-2.08-34.62-6.24-10.52-4.16-19.56-9.99-27.13-17.48-7.57-7.49-13.47-16.42-17.71-26.79-4.24-10.36-6.36-21.83-6.36-34.39s2.23-24.48,6.7-34.84c4.46-10.36,10.59-19.18,18.39-26.45,7.79-7.26,16.99-12.86,27.58-16.8,10.59-3.93,22.09-5.9,34.5-5.9,5.14,0,10.52,.49,16.12,1.48,5.6,.99,10.97,2.5,16.12,4.54,5.14,2.04,9.99,4.58,14.53,7.6,4.54,3.03,8.4,6.66,11.58,10.9l-21.79,17.25Z"></path>
                </g>
                <g id="GEO">
                  <path id="O" class="cls-2" d="M609.17,142.37c0-12.86,2.16-24.48,6.47-34.84,4.31-10.36,10.29-19.18,17.93-26.45,7.64-7.26,16.72-12.86,27.24-16.8,10.52-3.93,21.98-5.9,34.39-5.9s24.14,1.97,34.73,5.9c10.59,3.94,19.75,9.53,27.47,16.8,7.72,7.26,13.73,16.08,18.05,26.45,4.31,10.37,6.47,21.98,6.47,34.84s-2.16,24.03-6.47,34.39c-4.31,10.37-10.33,19.29-18.05,26.79s-16.88,13.32-27.47,17.48c-10.59,4.16-22.17,6.24-34.73,6.24s-23.87-2.08-34.39-6.24c-10.52-4.16-19.6-9.99-27.24-17.48-7.64-7.49-13.62-16.42-17.93-26.79-4.31-10.36-6.47-21.83-6.47-34.39Zm31.1,0c0,8.63,1.32,16.54,3.97,23.72,2.65,7.19,6.43,13.43,11.35,18.73,4.92,5.3,10.74,9.42,17.48,12.37,6.73,2.95,14.19,4.43,22.36,4.43s15.66-1.47,22.47-4.43c6.81-2.95,12.67-7.07,17.59-12.37,4.92-5.29,8.7-11.54,11.35-18.73,2.65-7.19,3.97-15.09,3.97-23.72s-1.33-16.04-3.97-23.15c-2.65-7.11-6.39-13.32-11.24-18.61-4.84-5.29-10.67-9.46-17.48-12.49-6.81-3.03-14.38-4.54-22.7-4.54s-15.85,1.51-22.59,4.54c-6.74,3.03-12.52,7.19-17.37,12.49-4.84,5.3-8.59,11.5-11.24,18.61-2.65,7.12-3.97,14.83-3.97,23.15Z"></path>
                  <path id="E" class="cls-2" d="M490.79,62.47h106.46v24.97h-77.86v40.86h73.78v24.06h-73.78v45.4h81.95v25.42h-110.55V62.47Z"></path>
                  <path id="G" class="cls-2" d="M465.21,214.79c-8.17,3.94-17.14,7-26.9,9.19-9.76,2.19-21,3.29-33.71,3.29s-24.89-2.08-35.64-6.24c-10.75-4.16-19.98-9.99-27.69-17.48-7.72-7.49-13.73-16.42-18.05-26.79-4.31-10.36-6.47-21.83-6.47-34.39s2.23-24.48,6.7-34.84c4.46-10.36,10.59-19.18,18.39-26.45,7.79-7.26,16.99-12.86,27.58-16.8,10.59-3.93,22.09-5.9,34.5-5.9s24.63,1.85,35.3,5.56c10.67,3.71,19.26,8.59,25.77,14.64l-19.75,21.34c-4.09-4.54-9.8-8.4-17.14-11.58-7.34-3.18-15.32-4.77-23.95-4.77s-16.16,1.51-23.04,4.54c-6.89,3.03-12.75,7.19-17.59,12.49-4.85,5.3-8.59,11.5-11.24,18.61-2.65,7.12-3.97,14.83-3.97,23.15s1.32,16.54,3.97,23.72c2.64,7.19,6.43,13.43,11.35,18.73,4.92,5.3,10.9,9.42,17.93,12.37s15.02,4.43,23.95,4.43c12.26,0,22.93-1.89,32.01-5.67v-40.86h-33.82v-23.61h61.52v83.31Z"></path>
                </g>
              </g>
              <g id="Logo">
                <path id="C-2" data-name="C" class="cls-1" d="M141.87,198.43c-31.31,0-56.7-25.38-56.7-56.69s25.38-56.69,56.7-56.69c15.66,0,29.83,6.35,40.09,16.6l20.05-20.04c-15.39-15.39-36.65-24.91-60.14-24.91-46.97,0-85.05,38.07-85.05,85.04s38.08,85.04,85.05,85.04c23.49,0,44.75-9.53,60.14-24.93l-20.04-20.04c-10.26,10.27-24.43,16.62-40.09,16.62Z"></path>
                <path id="G-2" data-name="G" class="cls-2" d="M284.15,140.73h-101.61l57.52,57.51c-19.58,33.99-56.28,56.87-98.32,56.87-62.62,0-113.39-50.76-113.39-113.39S79.11,28.35,141.73,28.35c31.31,0,59.66,12.69,80.18,33.21l20.04-20.04C216.3,15.86,180.87,0,141.73,0,63.46,0,0,63.46,0,141.73s63.46,141.73,141.73,141.73c49.84,0,93.66-25.73,118.93-64.62h.01c14.83-22.39,23.47-49.24,23.47-78.12Z"></path>
              </g>
            </g>
          </g>
        </svg>
        </div>
        <div style="font-size: 33px;padding-bottom:25px"> - OGCAPI</div>
      </div>

 <div style="padding-left:20px">

   <!--- right floating panel with contact info -->
   <div style="margin-right: 10px;float: right;margin-top:20px;display:flex;flex-direction:column;width:fit-content">


      <div style="margin-right: 10px;float: right;margin-top:20px;display:flex;flex-direction:column;border: 1px solid black">
     <div style="font-size: 20px;padding:10px;font-weight:bold;background-color:#EEE;border-bottom:1px solid black">
       Responsible Party
     </div>
     <div style="padding-left:10px;padding-top:7px;">
       <xsl:variable name="url" select="$serviceMetadataInfo/gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:pointOfContact/gmd:CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:onlineResource/gmd:CI_OnlineResource/gmd:linkage/gmd:URL"></xsl:variable>
       <a href="{$url}" style="font-weight:bold;text-decoration: underline;color:rgb(28, 118, 209)">
         <xsl:value-of select="$serviceMetadataInfo/gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:pointOfContact/gmd:CI_ResponsibleParty/gmd:organisationName/gco:CharacterString"  />
       </a>
       <br/>
       <xsl:value-of select="$serviceMetadataInfo/gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:pointOfContact/gmd:CI_ResponsibleParty/gmd:individualName/gco:CharacterString"  />
       <br/>


     </div>
      </div>
      <div style="margin-right: 10px;float: right;margin-top:20px;display:flex;flex-direction:column;border: 1px solid black">
        <div style="font-size: 20px;padding:10px;font-weight:bold;background-color:#EEE;border-bottom:1px solid black">
          Address
        </div>
        <div style="padding-left:10px;padding-top:7px;padding-right:7px">
          <xsl:value-of select="$serviceMetadataInfo/gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:pointOfContact/gmd:CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/gmd:CI_Address/gmd:deliveryPoint/gco:CharacterString"  />
          <br/>
          <xsl:value-of select="$serviceMetadataInfo/gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:pointOfContact/gmd:CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/gmd:CI_Address/gmd:postalCode/gco:CharacterString"  />&#160;<xsl:value-of select="$serviceMetadataInfo/gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:pointOfContact/gmd:CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/gmd:CI_Address/gmd:city/gco:CharacterString"  />
          <br/>
          <xsl:value-of select="$serviceMetadataInfo/gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:pointOfContact/gmd:CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/gmd:CI_Address/gmd:country/gco:CharacterString"  />

          <br/>
          <br/>
          <xsl:variable name="email" select="$serviceMetadataInfo/gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:pointOfContact/gmd:CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/gmd:CI_Address/gmd:electronicMailAddress/gco:CharacterString"></xsl:variable>
          <xsl:variable name="phone" select="$serviceMetadataInfo/gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:pointOfContact/gmd:CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:phone/gmd:CI_Telephone/gmd:voice/gco:CharacterString"></xsl:variable>

          <a href="mailto:{$email}" style="font-weight:bold;text-decoration: underline;color:rgb(28, 118, 209)">
            <xsl:value-of select="$serviceMetadataInfo/gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:pointOfContact/gmd:CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/gmd:CI_Address/gmd:electronicMailAddress/gco:CharacterString"  />
          </a>
          <br/>
          <a href="tel:{$phone}" style="font-weight:bold;text-decoration: underline;color:rgb(28, 118, 209)">
            <xsl:value-of select="$serviceMetadataInfo/gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:pointOfContact/gmd:CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:phone/gmd:CI_Telephone/gmd:voice/gco:CharacterString"  />
          </a>

          <br/>

        </div>
      </div>

   </div>



   <div style="font-size:40px;font-weight:bold;padding-top:20px;color:#666">
        <xsl:value-of select="$serviceMetadataInfo/gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:citation/gmd:CI_Citation/gmd:title/gco:CharacterString"  />
    </div>
   <div style="font-size:20px;font-weight:bold;padding-top:10px;color:#777">
     <xsl:value-of select="$serviceMetadataInfo/gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:abstract/gco:CharacterString"  />
   </div>
   <div style="display:flex;flex-direction:row;padding-top:8px">
     <xsl:for-each select="$serviceMetadataInfo/gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:descriptiveKeywords/gmd:MD_Keywords/gmd:keyword/gco:CharacterString">
       <xsl:if test="not(normalize-space(.)='')">
         <div style="border:1px solid black;padding: 2px; border-radius: 8px;  margin-right: 10px;background-color:#0099ff; color:white;">
           <xsl:value-of select="."/>
         </div>
       </xsl:if>
     </xsl:for-each>
   </div>

   <div style="    font-size: 20px;margin-top:20px;margin-left:0px;background-color: #EEE;border: 1px solid #333;padding:20px;width: fit-content;">
     <table >
       <xsl:if test="$serviceMetadataInfo/gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:resourceConstraints/gmd:MD_LegalConstraints/gmd:useLimitation/gco:CharacterString">
           <tr>
             <td style="padding-right:5px">Limitation:</td>
             <td style="text-decoration: underline;color:rgb(28, 118, 209)">
               <xsl:variable name="url" select="$serviceMetadataInfo/gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:resourceConstraints/gmd:MD_LegalConstraints/gmd:otherConstraints/gmx:Anchor/@xlink:href"></xsl:variable>
               <a href="{$url}">
                <xsl:value-of select="$serviceMetadataInfo/gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:resourceConstraints/gmd:MD_LegalConstraints/gmd:otherConstraints/gmx:Anchor"  />
               </a>
             </td>
           </tr>
       </xsl:if>
     </table>
   </div>

 <div>
      <div style="font-size:30px;padding-top:10px">Collections</div>
        <a style="font-size:22px;text-decoration: underline;color:rgb(28, 118, 209)" href="{$requestUrl}/collections">View Collections in this service</a>
  </div>



  </div>
    </html>
  </xsl:template>



</xsl:stylesheet>