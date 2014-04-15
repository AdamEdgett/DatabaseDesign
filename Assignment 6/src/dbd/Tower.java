package dbd;

import javax.persistence.*;
import javax.xml.bind.annotation.*;
import java.util.List;

@Entity
@Table(name="tower")
@XmlRootElement
@XmlAccessorType(value = XmlAccessType.FIELD)
public class Tower {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    @XmlAttribute
    private Integer id;

    @Column(name="name")
    @XmlAttribute
    private String name;

    @Column(name="height")
    @XmlAttribute
    private Double height;

    @Column(name="sides")
    @XmlAttribute
    private Integer sides;

    @JoinColumn(name="siteId")
    @ManyToOne
    @XmlTransient
    private Site site;

    @OneToMany(mappedBy="tower", cascade=CascadeType.ALL, orphanRemoval=true)
    @XmlElement(name="equipment")
    private List<Equipment> equipments;

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

    public Double getHeight() {
        return height;
    }

    public void setHeight(Double height) {
        this.height = height;
    }

    public Integer getSides() {
        return sides;
    }

    public void setSides(Integer sides) {
        this.sides = sides;
    }

    public Site getSite() {
        return site;
    }

    public void setSite(Site site) {
        this.site = site;
    }

    public List<Equipment> getEquipments() {
        return equipments;
    }

    public void setEquipments(List<Equipment> equipments) {
        this.equipments = equipments;
    }
}
