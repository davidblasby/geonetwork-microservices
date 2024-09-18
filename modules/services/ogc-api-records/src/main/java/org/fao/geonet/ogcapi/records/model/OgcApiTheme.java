/**
 * (c) 2024 Open Source Geospatial Foundation - all rights reserved This code is licensed under the
 * GPL 2.0 license, available at the root application directory.
 */

package org.fao.geonet.ogcapi.records.model;

import static org.fao.geonet.ogcapi.records.util.JsonUtils.getAsString;
import static org.fao.geonet.ogcapi.records.util.JsonUtils.getLangString;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import org.springframework.util.StringUtils;

/**
 * cf https://github.com/opengeospatial/ogcapi-records/blob/master/core/openapi/schemas/theme.yaml
 *
 * <p>This is the ogcapi "theme" object model.
 *
 * <p>From ogcapi-records spec:
 *
 * <p>Themes are concepts associated with the resource(s) that a record describes taken from
 * one or more formal knowledge organization systems or schemes.
 */
public class OgcApiTheme {

  /**
   * One or more entity/concept identifiers from this knowledge system. it is recommended that a
   * resolvable URI be used for each entity/concept identifier.
   */
  @JsonInclude(Include.NON_EMPTY)
  @XmlElementWrapper(name = "concepts")
  @XmlElement(name = "concepts")
  public List<OgcApiConcept> concepts;

  /**
   * An identifier for the knowledge organization system used to classify the resource.  It is
   * recommended that the identifier be a resolvable URI.  The list of schemes used in a searchable
   * catalog can be determined by inspecting the server's OpenAPI document or, if the server
   * implements CQL2, by exposing a queryable (e.g. named `scheme`) and enumerating the list of
   * schemes in the queryable's schema definition.
   */
  @JsonInclude(Include.NON_EMPTY)
  @XmlElementWrapper(name = "schema")
  @XmlElement(name = "schema")
  public String schema;

  public OgcApiTheme(String schema) {
    this.schema = schema;
    this.concepts = new ArrayList<>();
  }

  /**
   * Parse the Elastic (JSON) Index document.  Call with  linkedServiceRecord.get("allKeyWords").
   *
   * @param map map from Elastic (JSON) Index document representing "allKeyWords"
   * @return map will be parsed into a corresponding List of OgcApiTheme
   */
  public static List<OgcApiTheme> parseElasticIndex(Map<String, Object> map) {
    if (map == null) {
      return null;
    }
    List<OgcApiTheme> result = new ArrayList<>();
    for (var thSetObject : map.values()) {
      var thSet = (Map<String, Object>) thSetObject;

      var themeSchema = getAsString(thSet.get("link"));
      //at least put something here!
      if (!StringUtils.hasText(themeSchema)) {
        if (StringUtils.hasText(getAsString(thSet.get("multilingualTitle")))) {
          themeSchema = getLangString(thSet.get("multilingualTitle").toString());
        }
      }
      if (!StringUtils.hasText(themeSchema) && thSet.get("title") != null) {
        themeSchema = thSet.get("title").toString();
      }
      if (!StringUtils.hasText(themeSchema) && thSet.get("theme") != null) {
        themeSchema = thSet.get("theme").toString();
      }
      if (!StringUtils.hasText(themeSchema) && thSet.get("id") != null) {
        themeSchema = thSet.get("id").toString();
      }
      var theme = new OgcApiTheme(themeSchema);

      List conceptsList = (List) thSet.get("keywords");
      for (var anConcept : conceptsList) {
        var concept = (Map<String, Object>) anConcept;
        var link = getAsString(concept.get("link"));
        var ogcConcept = new OgcApiConcept(getLangString(anConcept), link);
        theme.getConcepts().add(ogcConcept);
      }
      if (theme.getConcepts().size() != 0) {
        result.add(theme);
      }
    }
    return result;
  }

  public List<OgcApiConcept> getConcepts() {
    return concepts;
  }

  public void setConcepts(List<OgcApiConcept> concepts) {
    this.concepts = concepts;
  }

  public String getSchema() {
    return schema;
  }

  public void setSchema(String schema) {
    this.schema = schema;
  }
}
