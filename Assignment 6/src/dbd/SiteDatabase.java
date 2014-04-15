package dbd;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.List;

@XmlRootElement
@XmlAccessorType(value = XmlAccessType.FIELD)
public class SiteDatabase {
    @XmlElement(name="site")
    private List<Site> sites;

    public SiteDatabase() {
        super();
    }

    public SiteDatabase(List<Site> sites) {
        super();
        this.sites = sites;
    }

    public List<Site> getSites() {
        return sites;
    }

    public void setSites(List<Site> sites) {
        this.sites = sites;
    }
}
