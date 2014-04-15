package dbd;

import javax.persistence.*;
import javax.xml.bind.annotation.*;
import java.util.List;

@Entity
@NamedQuery(name="Site.findAllSites", query="SELECT s FROM Site s")
@Table(name="site")
@XmlRootElement
@XmlAccessorType(value = XmlAccessType.FIELD)
public class Site {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    @XmlAttribute
    private Integer id;

    @Column(name="name")
    @XmlAttribute
    private String name;

    @Column(name="latitude")
    @XmlAttribute
    private Double latitude;

    @Column(name="longitude")
    @XmlAttribute
    private Double longitude;

    @OneToMany(mappedBy="site")
    @XmlElement(name="tower")
    private List<Tower> towers;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    public Double getLongitude() {
        return longitude;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }

    public List<Tower> getTowers() {
        return towers;
    }

    public void setTowers(List<Tower> towers) {
        this.towers = towers;
    }
}
