/**
 * (c) 2024 Open Source Geospatial Foundation - all rights reserved This code is licensed under the
 * GPL 2.0 license, available at the root application directory.
 */

package org.fao.geonet.ogcapi.records.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;


/**
 * Email addresses at which contact can be made.
 */
@XmlRootElement(name = "email")
@XmlAccessorType(XmlAccessType.FIELD)
public class OgcApiEmail {

  /**
   * The value is the email number itself.
   */
  @JsonInclude(Include.NON_EMPTY)
  @XmlElementWrapper(name = "value")
  @XmlElement(name = "value")
  private String value;

  /**
   * The type of email (e.g. home, work, etc.).
   */
  @JsonInclude(Include.NON_EMPTY)
  @XmlElementWrapper(name = "roles")
  @XmlElement(name = "roles")
  private List<String> roles = new ArrayList<>();

  public OgcApiEmail(String email) {
    value = email;
  }

  public String getValue() {
    return value;
  }

  public void setValue(String value) {
    this.value = value;
  }

  public List<String> getRoles() {
    return roles;
  }

  public void setRoles(List<String> roles) {
    this.roles = roles;
  }
}

