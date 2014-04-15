package dbd;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;
import java.util.List;

public class SiteDao {
    private static EntityManagerFactory factory =
            Persistence.createEntityManagerFactory("dbd");

    public Site findSite(int siteId) {
        EntityManager em = factory.createEntityManager();
        em.getTransaction().begin();
        Site site = em.find(Site.class, siteId);
        em.getTransaction().commit();
        em.close();

        return site;
    }

    @SuppressWarnings("unchecked")
    public List<Site> findAllSites() {
        EntityManager em = factory.createEntityManager();
        em.getTransaction().begin();
        Query query = em.createNamedQuery("Site.findAllSites");
        List<Site> sites = query.getResultList();
        em.getTransaction().commit();
        em.close();

        return sites;
    }

    public void exportSiteDatabaseToXmlFile(
            SiteDatabase database, String xmlFileName) {
        File xmlFile = new File(xmlFileName);
        try {
            JAXBContext jaxb = JAXBContext.newInstance(SiteDatabase.class);
            Marshaller marshaller = jaxb.createMarshaller();
            marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
            marshaller.marshal(database, xmlFile);
        } catch (JAXBException e) {
            e.printStackTrace();
        }
    }

    public void convertXmlFileToOutputFile(
            String inputXmlFileName, String outputXmlFileName,
            String xsltFileName) {
        File inputXmlFile = new File(inputXmlFileName);
        File xsltFile = new File(xsltFileName);
        File outputXmlFile = new File(outputXmlFileName);

        StreamSource source = new StreamSource(inputXmlFile);
        StreamSource xslt = new StreamSource(xsltFile);
        StreamResult output = new StreamResult(outputXmlFile);

        TransformerFactory factory = TransformerFactory.newInstance();
        try {
            Transformer transformer = factory.newTransformer(xslt);
            transformer.transform(source, output);
        } catch (TransformerConfigurationException e) {
            e.printStackTrace();
        } catch (TransformerException e) {
            e.printStackTrace();
        }

    }

    public static void main(String[] args) {
        SiteDao dao = new SiteDao();

        List<Site> sites = dao.findAllSites();
        SiteDatabase siteDatabase = new SiteDatabase(sites);
        dao.exportSiteDatabaseToXmlFile(siteDatabase, "xml/sites.xml");
        dao.convertXmlFileToOutputFile(
                "xml/sites.xml", "xml/sites.html", "xml/sites2html.xslt"
        );
        dao.convertXmlFileToOutputFile(
                "xml/sites.xml", "xml/equipments.html",
                "xml/sites2equipment.xslt"
        );
    }
}
