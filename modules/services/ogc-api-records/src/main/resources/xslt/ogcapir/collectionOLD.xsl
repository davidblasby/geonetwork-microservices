<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:gn-ogcapir-util="https://geonetwork-opensource.org/gn-ogcapir-util"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
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
    <xsl:variable name="collection"
                  select="model/collection"
                  as="node()?"/>

    <xsl:variable name="label"
                  select="gn-ogcapir-util:getCollectionName($collection, $language)"
                  as="xs:string"/>

    <xsl:variable name="properties"
                  select="tokenize($label, '\|')"
                  as="xs:string*"/>

    <xsl:variable name="outputFormats"
                  select="/model/outputFormats/outputFormat/name"
                  as="node()*"/>

    <xsl:variable name="title"
                  select="if (empty($properties[1])) then name else $properties[1]"/>
    <xsl:variable name="subTitle"
                  select="if (empty($properties[2])) then '' else $properties[2]"/>
    <html>
      <xsl:attribute name="lang" select="$language"/>
      <xsl:call-template name="html-head">
        <xsl:with-param name="title" select="$title"/>
      </xsl:call-template>

<!--          <xsl:call-template name="html-breadcrumb">-->
<!--            <xsl:with-param name="breadcrumb" select="$subTitle"/>-->
<!--          </xsl:call-template>-->

          <xsl:variable name="total"
                        as="xs:integer?"
                        select="model/results/total/total"/>

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
          <div class="container mx-auto flex flex-wrap pt-4 pb-12 text-gray-800 md:px-4">
            <div class="w-2/3">
              <xsl:choose>
                <xsl:when test="model/results">

                  <xsl:variable name="q"
                                as="xs:string?"
                                select="model/request/entry[key = 'q']/value/item/text()"/>
                  <form>
                    <div class="mt-1 mb-4 flex">
                      <input type="text"
                             name="q"
                             id="collection_search"
                             class="border border-gray-300
                                    flex-1 block w-full
                                    rounded-l
                                    sm:text-sm px-4"
                             placeholder="Search"
                             autofocus=""
                             value="{$q}"/>

                      <button class="inline-flex items-center px-4 py-2 border border-l-0 border-gray-300 bg-gray-800 text-white text-sm" type="submit">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                        </svg>
                      </button>

                      <a href="items"
                         class="inline-flex items-center px-4 py-2 rounded-r border border-l-0 border-gray-300 text-sm">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
                          <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                          <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                        </svg>
                      </a>
                    </div>
                  </form>

                  <section class="w-full rounded shadow border border-gray-200 bg-white mb-4">
                    <div class="px-3 py-4 sm:px-5 bg-gray-50">
                      <h2 class="font-medium">
                        <xsl:choose>
                          <xsl:when test="$total = 0">
                            No record found.
                            <a href="items" class="underline">Search for something else</a> or
                            <a href=".." class="underline">in another collection?</a>
                          </xsl:when>
                          <xsl:when test="$total = 1">
                            <xsl:value-of select="$total"/> record
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:value-of select="$total"/> records
                          </xsl:otherwise>
                        </xsl:choose>
                      </h2>
                    </div>

                    <div class="border-t border-gray-200 flex flex-wrap">
                      <xsl:for-each select="model/results/results">
                        <xsl:call-template name="render-record-preview-title"/>
                      </xsl:for-each>
                    </div>


                    <xsl:variable name="startindex"
                                  as="xs:integer"
                                  select="if (model/request/entry[key = 'startindex']/value/item/text() castable as xs:integer)
                            then xs:integer(model/request/entry[key = 'startindex']/value/item/text())
                            else 10"/>

                    <xsl:variable name="limit"
                                  as="xs:integer"
                                  select="if (model/request/entry[key = 'limit']/value/item/text() castable as xs:integer)
                            then xs:integer(model/request/entry[key = 'limit']/value/item/text())
                            else 10"/>

                    <xsl:variable name="isEndOfResults"
                                  as="xs:boolean"
                                  select="($startindex + $limit) >= $total"/>
                    <xsl:if test="not($isEndOfResults)">
                      <xsl:variable name="requestParameters"
                                    as="xs:string"
                                    select="concat(
                                    if($q != '') then concat('q=', $q, '&amp;') else '',
                                    if($startindex > -1) then concat('startindex=', $startindex + $limit, '&amp;') else '',
                                    if($limit > -1) then concat('limit=', $limit) else ''
                                    )"/>
                      <a href="items?{$requestParameters}"
                         class="inline-flex items-center px-4 py-2 text-sm">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-right" viewBox="0 0 16 16">
                          <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
                          <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
                        </svg>
                      </a>
                    </xsl:if>
                  </section>
                </xsl:when>
                <xsl:otherwise>
                  <a href="{$requestUrl}/items">
                    <button class="p-4 rounded-full bg-gray-800 text-white
                                transition duration-500 ease-in-out
                                focus:outline-none focus:shadow-outline
                                transform transition hover:scale-105 duration-300 ease-in-out">
                      Browse datasets and maps...</button>
                  </a>
                </xsl:otherwise>
              </xsl:choose>
            </div>
            <div class="w-1/3">
              <xsl:call-template name="render-page-format-links">
                <xsl:with-param name="formats"
                                select="$outputFormats"/>
              </xsl:call-template>
            </div>
          </div>


    </html>
  </xsl:template>
</xsl:stylesheet>